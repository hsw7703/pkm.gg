from django.db.models import Q
from .models import Item, Skill, Item_build, Skill_build
from django.core.exceptions import BadRequest

def pokemon_filter(get):
    type_q = Q()
    damage_type_q = Q()
    attack_type_q = Q()
    q = Q()
    types = get.getlist("type")
    damage_types = get.getlist("damage_type")
    attack_types = get.getlist("attack_type")
    for type in types:
        type_q |= Q(type=type)
    for type in damage_types:
        damage_type_q |= Q(damage_type=type)
    for type in attack_types:
        attack_type_q |= Q(attack_type=type)
    q.add(type_q, Q.AND)
    q.add(damage_type_q, Q.AND)
    q.add(attack_type_q, Q.AND)
    return q

def item_filter(types):
    q = Q()
    for type in types:
        q |= Q(type=type)
    return (q)

def news_filter(types):
    q = Q()
    for type in types:
        q |= Q(type=type)
    return (q)

def build_item_filter(item_ids):
    q = Q()
    for item_id in item_ids:
        try:
            Item.objects.get(id=item_id)
        except (KeyError, Item.DoesNotExist):
            raise BadRequest('Invalid request.')
    q = Q(item_id_1 = item_ids[0])
    q &= Q(item_id_2 = item_ids[1])
    q &= Q(item_id_3 = item_ids[2])
    return Item_build.objects.filter(q)

def build_skill_filter(skill_ids, pkm_id):
    q = Q()
    for skill_id in skill_ids:
        try:
            Skill.objects.get(id=skill_id, pkm_id=pkm_id)
        except (KeyError, Skill.DoesNotExist):
            raise BadRequest('Invalid request.')
    q = Q(skill_id_1 = skill_ids[0])
    q &= Q(skill_id_2 = skill_ids[1])
    q &= Q(skill_id_3 = skill_ids[2])
    q &= Q(skill_id_4 = skill_ids[3])
    return Skill_build.objects.filter(q)
