from django.contrib import admin

# Register your models here.

from .models import Skill, Item, Pkm_item, Pokemon, Pkm_battle_item, Battle_item, Evolution, News, Contact, Item_upgrade_cost

class Pkm_itemAdmin(admin.ModelAdmin):
    list_display = ('item_id', 'pkm_id', 'count')
    search_fields = ['pkm_id__name_text']

class SkillAdmin(admin.ModelAdmin):
    search_fields = ['name_text', 'pkm_id__name_text']

class ContactAdmin(admin.ModelAdmin):
    list_display = ('msg', 'is_check', 'date')

class ItemUpgradeCostAdmin(admin.ModelAdmin):
    list_display = ('level', 'cost')

class BuildAdmin(admin.ModelAdmin):
    list_display = ('pkm_id', 'item_build_id', 'skill_build_id', 'battle_item_id', 'count')
    search_fields = ['pkm_id__name_text']

admin.site.register(Skill, SkillAdmin)
admin.site.register(Item)
admin.site.register(Pkm_item, Pkm_itemAdmin)
admin.site.register(Pokemon)
admin.site.register(Pkm_battle_item)
admin.site.register(Battle_item)
admin.site.register(Evolution)
admin.site.register(News)
admin.site.register(Item_upgrade_cost, ItemUpgradeCostAdmin)
admin.site.register(Contact, ContactAdmin)

from .models import Build, Update, Skill_build, Item_build, Old_build

admin.site.register(Build, BuildAdmin)
admin.site.register(Old_build)
admin.site.register(Update)
admin.site.register(Skill_build)
admin.site.register(Item_build)

######################################
# pokemon item build modify
#from .models import Pkm_item_test
#
#class Pkm_item_test_admin(admin.ModelAdmin):
#    list_display = ('pkm_id', 'count', 'item_id_1', 'item_id_2', 'item_id_3')
#    search_fields = ['pkm_id__name_text']
#admin.site.register(Pkm_item_test, Pkm_item_test_admin)
