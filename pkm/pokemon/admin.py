from django.contrib import admin

# Register your models here.

from .models import Skill, Item, Pkm_item, Pokemon, Pkm_battle_item, Battle_item, Evolution, News

admin.site.register(Skill)
admin.site.register(Item)
admin.site.register(Pkm_item)
admin.site.register(Pokemon)
admin.site.register(Pkm_battle_item)
admin.site.register(Battle_item)
admin.site.register(Evolution)
admin.site.register(News)
