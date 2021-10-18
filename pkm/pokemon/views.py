#from django.shortcuts import render
#from django.views import generic
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.utils import timezone

from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import PokemonSerializer, PokemonDetailSerializer, ItemMainSerializer, ItemDetailSerializer, BattleItemSerializer, NewsMainSerializer, ItemUpgradeSerializer
#from .models import Pokemon, Item, Battle_item, News, Skill, Pkm_item, Pkm_battle_item, Contact, Item_upgrade_cost
from .serializer_models import PokemonMainModel, PokemonDetailModel, ItemUpgradeModel

from . import models
from django.views.decorators.csrf import csrf_exempt

# Create your views here.

app_name = "pokemon"


from django.db import connection

from django.db.models import Q

def get_client_ip(request):
    allow_ips = ['127.0.0.0']
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    is_allow = False
    for allow_ip in allow_ips:
        if allow_ip == ip:
            is_allow = True
    if is_allow:
        return True
    else:
        return False


@api_view(['GET'])
def pokemonMainAPI(request):
#    if not get_client_ip(request):
#        return HttpResponse("Unauthorized", status=401)

    if request.GET:
        type_q = Q()
        damage_type_q = Q()
        attack_type_q = Q()
        q = Q()
        types = request.GET.getlist("type")
        damage_types = request.GET.getlist("damage_type")
        attack_types = request.GET.getlist("attack_type")
        if types and types[0]:
            for type in types:
                type_q |= Q(type=type)
        if damage_types and damage_types[0]:
                for type in damage_types:
                    damage_type_q |= Q(damage_type=type)
        if attack_types and attack_types[0]:
            for type in attack_types:
                attack_type_q |= Q(attack_type=type)
        q.add(type_q, Q.AND)
        q.add(damage_type_q, Q.AND)
        q.add(attack_type_q, Q.AND)
        pkms = models.Pokemon.objects.order_by("name_text").filter(q)
    else:
        pkms = models.Pokemon.objects.order_by("name_text")
    pokemon = []
    cursor = connection.cursor()
    cursor.execute('USE pokemon;')
    for pkm in pkms:
        pokemon.append(PokemonMainModel(pkm, cursor))
    serializer = PokemonSerializer(pokemon, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def pokemonDetailAPI(request, pkm_id):
    pkm = PokemonDetailModel(get_object_or_404(models.Pokemon, pk=pkm_id))

    serializer = PokemonDetailSerializer(pkm)
    return Response(serializer.data)

@api_view(['GET'])
def ItemMainAPI(request):
    if request.GET:
        q = Q()
        types = request.GET.getlist('type')
        if types and types[0]:
            for type in types:
                q |= Q(type=type)
        item = models.Item.objects.filter(q).order_by("name_text")
    else:
        item = models.Item.objects.order_by("name_text")
    serializer = ItemDetailSerializer(item, many=True)
    return Response(serializer.data)

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
    if request.GET:
        q = Q()
        types = request.GET.getlist('type')
        if types and types[0]:
            for type in types:
                q |= Q(type=type)
        news = models.News.objects.filter(q)
    else:
        news = models.News.objects.all()
    serializer = NewsMainSerializer(news, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def ItemUpgradeCostAPI(request):
    if request.GET:
        start_level = request.GET['start_level']
        end_level = request.GET['end_level']
        items = models.Item_upgrade_cost.objects.filter(level__gt=start_level, level__lte=end_level)
        cost = 0
        for item in items:
            cost += item.cost
        serializer = ItemUpgradeSerializer(ItemUpgradeModel(cost))
        return Response(serializer.data)

@csrf_exempt
def ContactPage(request):
    if request.POST:
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')
        name = request.POST['user_name']
        msg = request.POST['user_message']
        models.Contact(name=name, msg=msg, is_check=False, date=timezone.now(), ip=ip).save()
        return HttpResponseRedirect('https://pkm.gg/contact.html')


from .models import Build, Update, Skill_build, Item_build, Old_build
import json
from django.core.exceptions import BadRequest

@csrf_exempt
def build(request):
    if request.POST:
        data = json.loads(request.body)
        position = data['position']
        if len(data['item_id']) != 3:
            raise BadRequest('Invalid request.')
        q = Q()
        data['item_id'].sort()
        item_id = data['item_id']
        for id in item_id:
            try:
                models.Item.objects.get(id=id)
            except (KeyError, models.Item.DoesNotExist):
                raise BadRequest('Invalid request.')
        q = Q(item_id_1 = item_id[0])
        q &= Q(item_id_2 = item_id[1])
        q &= Q(item_id_3 = item_id[2])
        item = models.Item_build.objects.filter(q)

        if len(data['skill_id']) != 4:
            raise BadRequest('Invalid request.')
        skill_id = data['skill_id']
        for id in skill_id:
            try:
                models.Skill.objects.get(id=id, pkm_id=data['pkm_id'])
            except (KeyError, models.Skill.DoesNotExist):
                raise BadRequest('Invalid request.')
        q = Q(skill_id_1 = skill_id[0])
        q = Q(skill_id_2 = skill_id[1])
        q = Q(skill_id_3 = skill_id[2])
        q = Q(skill_id_4 = skill_id[3])
        skill = models.Skill_build.objects.filter(q)

        battle_item_id = data['battle_item_id']
        try:
            battle_item = models.Battle_item.objects.get(id=battle_item_id)
        except (KeyError, models.Battle_item.DoseNotExist):
            raise BadRequest('Invalid request.')

        update = models.Update.objects.filter(date__lte=timezone.now()).order_by('-date')[0]
        pkm = models.Pokemon.objects.get(id=data['pkm_id'])

        #업데이트 이후 빌드 old_build로 옮기고 count = 0으로 초기화 해야됨
        builds = models.Build.objects.filter(pkm_id=pkm.id)
        if builds:
            if builds[0].is_delete():
                for build in builds:
                    models.Old_build(pkm_id=build.pkm_id, update_id=build.update_id, item_build_id=build.item_build_id, skill_build_id=build.skill_build_id, battle_item_id=build.battle_item_id, count=build.count, date=build.date).save()
                build.delete()

        if item and skill:
            build = models.Build.objects.filter(item_build_id=item[0].id, battle_item_id=battle_item.id, skill_build_id=skill[0].id, position=position)
            if build:
                build[0].count += 1
                build[0].save()
            else:
                build = models.Build(pkm_id=pkm, item_build_id=item[0], battle_item_id=battle_item, skill_build_id=skill[0], count=1, date=timezone.now(), update_id=update, position=position)
                build.save()
        else:
            build = models.Build()
            if not item:
                item = models.Item_build(item_id_1=models.Item.objects.get(id=item_id[0]), item_id_2=models.Item.objects.get(id=item_id[1]), item_id_3=models.Item.objects.get(id=item_id[2]))
                item.save()
            else:
                item = item[0]
            if not skill:
                skill = models.Skill_build(skill_id_1=models.Skill.objects.get(id=skill_id[0]), skill_id_2=models.Skill.objects.get(id=skill_id[1]), skill_id_3=models.Skill.objects.get(id=skill_id[2]), skill_id_4=models.Skill.objects.get(id=skill_id[3]))
                skill.save()
            else:
                skill = skill[0]
            build.item_build_id = item
            build.skill_build_id = skill
            build.battle_item_id = battle_item
            build.date = timezone.now()
            build.update_id = update
            build.count = 1
            build.pkm_id = pkm
            build.position = position
            build.save()
    return HttpResponse("success")
