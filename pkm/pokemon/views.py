#from django.shortcuts import render
#from django.views import generic
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.utils import timezone

from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import PokemonSerializer, PokemonDetailSerializer, ItemMainSerializer, ItemDetailSerializer, BattleItemSerializer, NewsMainSerializer, ItemUpgradeSerializer
from .serializer_models import PokemonMainModel, PokemonDetailModel, ItemUpgradeModel

from . import models
from django.views.decorators.csrf import csrf_exempt

# Create your views here.

app_name = "pokemon"


from django.db import connection

from django.db.models import Q

from . import filter

def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return (ip)

@api_view(['GET'])
def pokemonMainAPI(request):
    pkms = models.Pokemon.objects.order_by("name_text")
    if request.GET:
        pkms = pkms.filter(filter.pokemon_filter(request.GET))
    pokemon = []
    cursor = connection.cursor()
    cursor.execute('USE pokemon;')
    for pkm in pkms:
        pokemon.append(PokemonMainModel(pkm, cursor))
    return Response(PokemonSerializer(pokemon, many=True).data)

@api_view(['GET'])
def pokemonDetailAPI(request, pkm_id):
    return Response(PokemonDetailSerializer(PokemonDetailModel(get_object_or_404(models.Pokemon, pk=pkm_id))).data)

@api_view(['GET'])
def ItemMainAPI(request):
    item = models.Item.objects.order_by("name_text")
    if request.GET:
        item = item.filter(filter.item_filter(request.GET.getlist('type')))
    return Response(ItemDetailSerializer(item, many=True).data)

@api_view(['GET'])
def BattleItemAPI(request):
    battle = models.Battle_item.objects.order_by("name_text")
    serializer = BattleItemSerializer(battle, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def BattleItemDetailAPI(request, id):
    battle = get_object_or_404(models.Battle_item, pk=id)
    serializer = BattleItemSerializer(battle)
    return Response(serializer.data)

@api_view(['GET'])
def ItemDetailAPI(request, id):
    item = get_object_or_404(models.Item, pk=id)
    serializer = ItemDetailSerializer(item)
    return Response(serializer.data)

@api_view(['GET'])
def NewsMainAPI(request):
    news = models.News.objects.all()
    if request.GET:
        news = news.filter(filter.news_filter(request.GET.getlist('type')))
    serializer = NewsMainSerializer(news, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def ItemUpgradeCostAPI(request):
    if request.GET:
        items = models.Item_upgrade_cost.objects.filter(level__gt=request.GET['start_level'], level__lte=request.GET['end_level'])
        cost = 0
        for item in items:
            cost += item.cost
        return Response(ItemUpgradeSerializer(ItemUpgradeModel(cost)).data)

@csrf_exempt
def ContactPage(request):
    if request.POST:
        name = request.POST['user_name']
        msg = request.POST['user_message']
        models.Contact(name=name, msg=msg, is_check=False, date=timezone.now(), ip=get_client_ip(request)).save()
        return HttpResponseRedirect('https://pkm.gg/contact.html')

from .models import Build, Update, Skill_build, Item_build, Old_build
import json
from django.core.exceptions import BadRequest
from . import build_func
from .checker import build_checker, battle_item_checker

@csrf_exempt
def build(request):
    if request.POST:
        data = json.loads(request.body)
        data['item_id'].sort()
        build_checker(data)

#        item = filter.build_item_filter(data['item_id'])
#        skill = filter.build_skill_filter(data['skill_id'], data['pkm_id'])
#        battle_item = battle_item_checker(data['battle_item_id'])
        update = models.Update.objects.filter(date__lte=timezone.now()).order_by('-date')[0]
        pkm = models.Pokemon.objects.get(id=data['pkm_id'])

        build_func.build_delete(models.Build.objects.filter(pkm_id=pkm.id))

#        item = build_func.item_build_save(item, data['item_id'])
#        skill = build_func.skill_build_save(skill, data['skill_id'])
#
#        build_func.build_save(pkm, skill, item, battle_item, data['position'], update)
        build_func.build_save(data, update)
        return HttpResponse("success")
    return HttpResponse(request, status=401)

from .serializer_models import BuildModel
from .serializers import BuildSerializer

@api_view(['GET'])
def build_list(request, pkm_id):
    size = 5
    if request.GET:
        print(request.GET)
        size = int(request.GET['size'])
    builds = Build.objects.filter(pkm_id=pkm_id).select_related("skill_build_id__skill_id_1", "skill_build_id__skill_id_2", "skill_build_id__skill_id_3", "skill_build_id__skill_id_4", "item_build_id__item_id_1", "item_build_id__item_id_2", "item_build_id__item_id_3", "battle_item_id").order_by('-count')
    if not builds:
        raise BadRequest('Invalid request.')
    count = 0
    for build in builds:
        count += build.count
    build = builds[:size]
    build_list = BuildModel(build, count)
    serializer = BuildSerializer(build_list)
    return Response(serializer.data)
