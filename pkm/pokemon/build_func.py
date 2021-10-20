from .models import Old_build, Build, Item_build, Item, Skill, Skill_build, Pokemon
from django.utils import timezone
from .filter import build_item_filter, build_skill_filter
from .checker import battle_item_checker

def build_delete(builds):
    if builds and builds[0].is_delete():
        for build in builds:
            Old_build(pkm_id=build.pkm_id, update_id=build.update_id, item_build_id=build.item_build_id, skill_build_id=build.skill_build_id, battle_item_id=build.battle_item_id, count=build.count, date=build.date).save()
            build.delete()

def item_build_save(item_id):
    item = build_item_filter(item_id)
    if not item:
        item = Item_build(item_id_1=Item.objects.get(id=item_id[0]), item_id_2=Item.objects.get(id=item_id[1]), item_id_3=Item.objects.get(id=item_id[2]))
        item.save()
    else:
        item = item[0]
    return item

def skill_build_save(skill_id, pkm_id):
    skill = build_skill_filter(skill_id, pkm_id)
    if not skill:
        skill = Skill_build(skill_id_1=Skill.objects.get(id=skill_id[0]), skill_id_2=Skill.objects.get(id=skill_id[1]), skill_id_3=Skill.objects.get(id=skill_id[2]), skill_id_4=Skill.objects.get(id=skill_id[3]))
        skill.save()
    else:
        skill = skill[0]
    return skill

def build_save(data, update):
    item = item_build_save(data['item_id'])
    battle_item = battle_item_checker(data['battle_item_id'])
    skill = skill_build_save(data['skill_id'], data['pkm_id'])
    build = Build.objects.filter(
        item_build_id = item,
        battle_item_id = battle_item,
        skill_build_id=skill,
        position=data['position'])
    if build:
        build[0].count += 1
        build[0].save()
    else:
        build = Build(pkm_id=Pokemon.objects.get(id=data['pkm_id']),
            item_build_id=item,
            battle_item_id=battle_item,
            skill_build_id=skill,
            count=1,
            date=timezone.now(),
            update_id=update,
            position=data['position']).save()
