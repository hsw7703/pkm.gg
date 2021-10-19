from django.db.models import Q

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
