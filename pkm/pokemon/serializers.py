from rest_framework import serializers
from .models import Item, Battle_item, News

class PopupSkillSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=20)
    name_text = serializers.CharField(max_length=20)
    img = serializers.CharField(max_length=50)
    level = serializers.IntegerField()

class PopupItemSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    img = serializers.CharField(max_length=50)
    name = serializers.CharField(max_length=20)
    name_text = serializers.CharField(max_length=20)

class PopupBattleItemSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=20)
    name_text = serializers.CharField(max_length=20)
    img = serializers.CharField(max_length=50)

class PokemonSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField(max_length=20)
    img = serializers.CharField(max_length=50)
    type = serializers.CharField(max_length=8)
    name = serializers.CharField(max_length=50)
    name_text = serializers.CharField(max_length=50)
    type = serializers.CharField(max_length=20)
    type_text = serializers.CharField(max_length=20)
    attack_type = serializers.CharField(max_length=20)
    attack_type_text = serializers.CharField(max_length=20)
    damage_type = serializers.CharField(max_length=20)
    damage_type_text = serializers.CharField(max_length=20)
    skill = PopupSkillSerializer(many=True)
    item = PopupItemSerializer(many=True)
    battle_item = PopupBattleItemSerializer(required=False)

class EvolutionSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=20)
    name_text = serializers.CharField(max_length=20)
    img = serializers.CharField(max_length=50)
    level = serializers.IntegerField()

class SkillSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    cooltime = serializers.CharField(max_length=4)
    name = serializers.CharField(max_length=20)
    name_text = serializers.CharField(max_length=20)
    type = serializers.CharField(max_length=20)
    type_text = serializers.CharField(max_length=20)
    img = serializers.CharField(max_length=50)
    level = serializers.IntegerField()
    description = serializers.CharField()

class PokemonDetailSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField(max_length=20)
    name_text = serializers.CharField(max_length=20)
    img = serializers.CharField(max_length=50)
    type = serializers.CharField(max_length=8)
    type_text = serializers.CharField(max_length=8)
    attack_type = serializers.CharField(max_length=20)
    attack_type_text = serializers.CharField(max_length=20)
    damage_type = serializers.CharField(max_length=20)
    damage_type_text = serializers.CharField(max_length=20)
    difficulty = serializers.CharField(max_length=10)
    difficulty_text = serializers.CharField(max_length=10)
    passive_name = serializers.CharField(max_length=20)
    passive_name_text = serializers.CharField(max_length=20)
    passive_img = serializers.CharField(max_length=50)
    passive_effect = serializers.CharField()
    attack_effect = serializers.CharField()
    offense = serializers.IntegerField()
    endurance = serializers.IntegerField()
    mobility = serializers.IntegerField()
    scoring = serializers.IntegerField()
    support = serializers.IntegerField()
    evolution = EvolutionSerializer(many=True)
    skill = SkillSerializer(many=True)
    recommend_skill = PopupSkillSerializer(many=True)
    item = PopupItemSerializer(many=True)
    battle_item = PopupBattleItemSerializer()

class ItemMainSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField(max_length=20)
    img = serializers.CharField(max_length=50)
    description = serializers.CharField()

class BattleItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Battle_item
        fields = '__all__'

class ItemDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = '__all__'

class NewsMainSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        fields = ('id', 'title', 'img', 'date', 'url', 'type')

#class NewsDetailSerializer(serializers.ModelSerializer):
#    class Meta:
#        model = News
#        fields = '__all__'
