from .models import Pkm_item, Pkm_battle_item, Skill

class PopupItemModel:
    def __init__(self, item):
        self.img = item['item_id__img']
        self.name = item['item_id__name']
        self.name_text = item['item_id__name_text']
        self.id = item['item_id']

class PopupBattleItemModel:
    def __init__(self, item):
        self.id = item.battle_item_id.id
        self.name = item.battle_item_id.name
        self.name_text = item.battle_item_id.name_text
        self.img = item.battle_item_id.img

class PopupSkillModel:
    def __init__(self, skill):
#        self.name = skill.name
#        self.name_text = skill.name_text
#        self.img = skill.img
#        self.level = skill.level
        self.name = skill['name']
        self.name_text = skill['name_text']
        self.img = skill['img']
        self.level = skill['level']


from django.db import connection

class PokemonMainModel:
    def __init__(self, pkm, cursor):
        self.id = pkm.id
        self.name = pkm.name
        self.name_text = pkm.name_text
        self.img = pkm.img
        self.type = pkm.type
        self.type_text = pkm.type_text
        self.attack_type = pkm.attack_type
        self.attack_type_text = pkm.attack_type_text
        self.damage_type = pkm.damage_type
        self.damage_type_text = pkm.damage_type_text
        self.item = []
        self.skill = []
#        skills = Skill.objects.filter(pkm_id=pkm.id).order_by('level', '-count')
#        print(skills.query)
        sql = f"SELECT * FROM pokemon_skill WHERE pkm_id_id = {pkm.id} ORDER BY level ASC, count DESC;"
        if cursor.execute(sql) == 7:
            result = cursor.fetchall()
            skills = []

            for index in range(0, 7):
                skills.append({'name_text':result[index][2], 'img':result[index][4], 'level':result[index][5], 'name': result[index][9]})
            self.skill.append(PopupSkillModel(skills[0]))
            self.skill.append(PopupSkillModel(skills[1]))
            self.skill.append(PopupSkillModel(skills[2]))
            self.skill.append(PopupSkillModel(skills[4]))
        items = Pkm_item.objects.select_related("item_id").filter(pkm_id=self.id).order_by('-count')[:3].values('item_id__img', 'item_id__name', 'item_id__name_text', 'item_id')
        for item in items:
            self.item.append(PopupItemModel(item))
        battle = Pkm_battle_item.objects.select_related('battle_item_id').filter(pkm_id=self.id).order_by('-count')
        if battle:
            self.battle_item = PopupBattleItemModel(battle[0])

class PokemonEvolutionModel:
    def __init__(self, evol):
        self.name = evol.name
        self.name_text = evol.name_text
        self.img = evol.img
        self.level = evol.level

class PokemonDetailModel:
    def __init__(self, pkm):
        self.id = pkm.id
        self.name = pkm.name
        self.name_text = pkm.name_text
        self.img = pkm.detail_img
        self.type = pkm.type
        self.type_text = pkm.type_text
        self.attack_type = pkm.attack_type
        self.attack_type_text = pkm.attack_type_text
        self.damage_type = pkm.damage_type
        self.damage_type_text = pkm.damage_type_text
        self.difficulty = pkm.difficulty
        self.difficulty_text = pkm.difficulty_text
        self.passive_name = pkm.passive_name
        self.passive_name_text = pkm.passive_name_text
        self.passive_img = pkm.passive_img
        self.passive_effect = pkm.passive_effect
        self.attack_effect = pkm.attack_effect
        self.offense = pkm.offense
        self.endurance = pkm.endurance
        self.mobility = pkm.mobility
        self.scoring = pkm.scoring
        self.support = pkm.support
        evols = pkm.evolution_set.all()
        self.evolution = []
        for evol in evols:
            self.evolution.append(PokemonEvolutionModel(evol))
        self.recommend_skill = []

        skills = pkm.skill_set.all().order_by('level', '-count').values('name', 'name_text', 'img', 'level')
        if skills.count() != 0:
            self.recommend_skill.append(PopupSkillModel(skills[0]))
            self.recommend_skill.append(PopupSkillModel(skills[1]))
            self.recommend_skill.append(PopupSkillModel(skills[2]))
            self.recommend_skill.append(PopupSkillModel(skills[4]))
        self.item = []
        self.skill = pkm.skill_set.all().order_by('level')

        items = Pkm_item.objects.select_related("item_id").filter(pkm_id=self.id).order_by('-count')[:3].values('item_id__img', 'item_id__name', 'item_id__name_text', 'item_id')
        for item in items:
            self.item.append(PopupItemModel(item))
        battle = Pkm_battle_item.objects.select_related('battle_item_id').filter(pkm_id=self.id).order_by('-count')
        if battle:
            self.battle_item = PopupBattleItemModel(battle[0])

class ItemUpgradeModel:
    def __init__(self, cost):
        self.cost = cost

#        items = Pkm_item.objects.filter(pkm_id=self.id).order_by('-count')[:3]
#        print(items[0])
#        for item in items:
#            self.item.append(PopupItemModel(item))
#        self.battle_item = PopupBattleItemModel(Pkm_battle_item.objects.filter(pkm_id=self.id).order_by('-count')[0])

#class ItemMainModel:
#    def __init__(self, item):
#        self.name = item.name
#        self.img = item.img
#        self.effect_description = item.effect_description
#        self.effect_1 = item.effect_1
#        self.effect_2 = item.effect_2
#        self.effect_3 = item.effect_3

#####################################################3
#pokemon item build modify
#from .models import Pkm_item_test
#
#class PopupItemTestModel:
#    def __init__(self, item):
#        self.img = item['item_img']
#        self.name = item['item_name']
#        self.name_text = item['item_name_text']
#
#class PokemonMainTestModel:
#    def __init__(self, pkm):
#        self.id = pkm.id
#        self.name = pkm.name
#        self.name_text = pkm.name_text
#        self.img = pkm.img
#        self.type = pkm.type
#        self.type_text = pkm.type_text
#        self.attack_type = pkm.attack_type
#        self.attack_type_text = pkm.attack_type_text
#        self.damage_type = pkm.damage_type
#        self.damage_type_text = pkm.damage_type_text
#        self.item = []
#        self.skill = []
#        skills = Skill.objects.filter(pkm_id=pkm.id).order_by('level', '-count')
#        if skills.count() != 0:
#            self.skill.append(PopupSkillModel(skills[0]))
#            self.skill.append(PopupSkillModel(skills[1]))
#            self.skill.append(PopupSkillModel(skills[2]))
#            self.skill.append(PopupSkillModel(skills[4]))
#        items = Pkm_item_test.objects.select_related("item_id_1", "item_id_2", "item_id_3").filter(pkm_id=self.id).order_by('-count')[:3].values('item_id_1__img', 'item_id_1__name', 'item_id_1__name_text', 'item_id_2__img', 'item_id_2__name', 'item_id_2__name_text', 'item_id_3__img', 'item_id_3__name', 'item_id_3__name_text')
#        item_temp = {}
#        if items:
#            for index in range(1, 4):
#                item_temp['item_img'] = items[0]['item_id_' + str(index) + '__img']
#            item_temp['item_name'] = items[0]['item_id_' + str(index) + '__name']
#            item_temp['item_name_text'] = items[0]['item_id_' + str(index) + '__name_text']
#            self.item.append(PopupItemTestModel(item_temp))
#        battle = Pkm_battle_item.objects.select_related('battle_item_id').filter(pkm_id=self.id).order_by('-count')
#        if battle:
#            self.battle_item = PopupBattleItemModel(battle[0])
