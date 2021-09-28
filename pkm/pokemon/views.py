#from django.shortcuts import render
#from django.views import generic
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect

from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import PokemonSerializer, PokemonDetailSerializer, ItemMainSerializer, ItemDetailSerializer, BattleItemSerializer, NewsMainSerializer
from .models import Pokemon, Item, Battle_item, News, Skill, Pkm_item, Pkm_battle_item
from .serializer_models import PokemonMainModel, PokemonDetailModel

# Create your views here.

app_name = "pokemon"


from django.db import connection

from django.db.models import Q
@api_view(['GET'])
def pokemonMainAPI(request):
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
        pkms = Pokemon.objects.order_by("name_text").filter(q)
    else:
        pkms = Pokemon.objects.order_by("name_text")
    pokemon = []
    cursor = connection.cursor()
    cursor.execute('USE pokemon;')
    for pkm in pkms:
        pokemon.append(PokemonMainModel(pkm, cursor))
    serializer = PokemonSerializer(pokemon, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def pokemonDetailAPI(request, pkm_id):
    pkm = PokemonDetailModel(get_object_or_404(Pokemon, pk=pkm_id))

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
        item = Item.objects.filter(q).order_by("name_text")
    else:
        item = Item.objects.order_by("name_text")
    serializer = ItemDetailSerializer(item, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def BattleItemAPI(request):
    battle = Battle_item.objects.order_by("name_text")
    serializer = BattleItemSerializer(battle, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def ItemDetailAPI(request, id):
    item = get_object_or_404(Item, pk=id)
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
        news = News.objects.filter(q)
    else:
        news = News.objects.all()
    serializer = NewsMainSerializer(news, many=True)
    return Response(serializer.data)
    
#@api_view(['GET'])
#def NewsDetailAPI(request, news_id):
#    news = get_object_or_404(News, pk=news_id)
#    serializer = NewsDetailSerializer(news)
#    return Response(serializer.data)



from django.views.decorators.csrf import csrf_exempt
@csrf_exempt
def build(request):
    pkm_id = request.POST.get('pkm_id')
    for index in range(1, 4):
        item_id = request.POST['item_id_' + str(index)]
        item = Pkm_item.objects.filter(pkm_id=pkm_id, item_id=item_id)
        if item:
            item = Pkm_item.objects.get(pkm_id=pkm_id, item_id=item_id)
            item.count += 1
        else:
            item = Pkm_item(pkm_id=Pokemon.objects.get(id=pkm_id), item_id=Item.objects.get(id=item_id), count=1)
        item.save()

    for index in range(1, 5):
        skill_id = request.POST['skill_id_' + str(index)]
        skill = Skill.objects.get(id=skill_id)
        skill.count += 1
        skill.save()

    battle_item_id = request.POST['battle_item_id']
    battle = Pkm_battle_item.objects.filter(pkm_id=pkm_id, battle_item_id=battle_item_id)
    if battle:
        battle[0].count += 1
        battle[0].save()
    else:
        battle = Pkm_battle_item(pkm_id=Pokemon.objects.get(id=pkm_id), battle_item_id=Battle_item.objects.get(id=battle_item_id), count=1)
        battle.save()
    return HttpResponseRedirect('http://localhost:8000/pokemon/' + pkm_id)

# item build modify

#from .serializer_models import PokemonMainTestModel
#from .models import Pkm_item_test
#@csrf_exempt
#def buildTest(request):
#    pkm_id = request.POST.get('pkm_id')
#    item_id = []
#    for index in range(1, 4):
#        item_id.append(int(request.POST['item_id_' + str(index)]))
#    item_id.sort()
#    
#    q = Q()
#    q &= Q(item_id_1 = item_id[0])
#    q &= Q(item_id_2 = item_id[1])
#    q &= Q(item_id_3 = item_id[2])
#    q &= Q(pkm_id = pkm_id)
#    item = Pkm_item_test.objects.filter(q)
#    if item:
#        item[0].count += 1
#        item[0].save()
#    else:
#        Pkm_item_test(pkm_id=Pokemon.objects.get(id=pkm_id), item_id_1=Item.objects.get(id=item_id[0]), item_id_2=Item.objects.get(id=item_id[1]), item_id_3=Item.objects.get(id=item_id[2]), count=1).save()
#    for index in range(1, 5):
#        skill_id = request.POST['skill_id_' + str(index)]
#        skill = Skill.objects.get(id=skill_id)
#        skill.count += 1
#        skill.save()
#
#    battle_item_id = request.POST['battle_item_id']
#    battle = Pkm_battle_item.objects.filter(pkm_id=pkm_id, battle_item_id=battle_item_id)
#    if battle:
#        battle[0].count += 1
#        battle[0].save()
#    else:
#        battle = Pkm_battle_item(pkm_id=Pokemon.objects.get(id=pkm_id), battle_item_id=Battle_item.objects.get(id=battle_item_id), count=1)
#        battle.save()
#    return HttpResponseRedirect('http://localhost:8000/pokemon/' + pkm_id)
#
#
#    return HttpResponse("hello")
#
#@api_view(['GET'])
#def pokemonMainTestAPI(request):
#    pkms = Pokemon.objects.filter(id=2).order_by("name_text")
#    pokemon = []
#    for pkm in pkms:
#        pokemon.append(PokemonMainTestModel(pkm))
#    serializer = PokemonSerializer(pokemon, many=True)
#    return Response(serializer.data)
