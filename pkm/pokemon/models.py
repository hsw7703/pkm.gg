from django.db import models

# Create your models here.

class Pokemon(models.Model):
    name_text = models.CharField(unique=True, max_length=20)
    img = models.CharField(max_length=200)
    detail_img = models.CharField(max_length=200, default="")
    attack_type_text = models.CharField(max_length=8, default="")
    attack_type = models.CharField(max_length=10, default="")
    type_text = models.CharField(max_length=10, default="")
    damage_type_text = models.CharField(max_length=10, default="")
    damage_type = models.CharField(max_length=10, default="")
    difficulty_text = models.CharField(max_length=10, default="")
    difficulty = models.CharField(max_length=10, default="")
    passive_name_text = models.CharField(max_length=20)
    passive_name = models.CharField(max_length=20, default="")
    passive_img = models.CharField(max_length=200)
    passive_effect = models.TextField()
    attack_effect = models.TextField()
    offense = models.IntegerField()
    endurance = models.IntegerField()
    mobility = models.IntegerField()
    scoring = models.IntegerField()
    support = models.IntegerField()
    name = models.CharField(max_length=50, default="")
    type = models.CharField(max_length=20, default="")
#    level = models.IntegerField(null=True, default=0)
#    before_id = models.BigIntegerField(null=True, default=0)

    class Meta:
        indexes = [
            models.Index(fields = ['name_text'])
        ]

    def __str__(self):
        return self.name_text

class Evolution(models.Model):
    pkm_id = models.ForeignKey(Pokemon, on_delete=models.CASCADE)
    name_text = models.CharField(max_length=20, default="")
    name = models.CharField(max_length=20, default="")
    img = models.CharField(max_length=200)
    level = models.IntegerField()

    def __str__(self):
        return self.pkm_id.name_text + " : " + self.name_text

class Skill(models.Model):
    pkm_id = models.ForeignKey(Pokemon, on_delete=models.CASCADE)
    cooltime = models.CharField(max_length=4)
    name_text = models.CharField(max_length=20)
    name = models.CharField(max_length=20, default="")
    type_text = models.CharField(max_length=20)
    type = models.CharField(max_length=20, default="")
    img = models.CharField(max_length=200)
    level = models.IntegerField()
    description = models.TextField(default="")
    count = models.BigIntegerField()

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=["pkm_id", "name"],
                name = "pokemon skill",
            ),
        ]
    
    def __str__(self):
        return self.pkm_id.name_text + " : " + self.name_text

class Item(models.Model):
    name_text = models.CharField(max_length=20)
    name = models.CharField(max_length=20, default="")
    description = models.TextField()
    img = models.CharField(max_length=200, default="")
    type_text = models.CharField(max_length=10, default="")
    type = models.CharField(max_length=10, default="")
    effect_description = models.CharField(max_length=10)
    effect_1 = models.CharField(max_length=10)
    effect_2 = models.CharField(max_length=10)
    effect_3 = models.CharField(max_length=10)
    status_increase = models.CharField(max_length=30, default="")
    status_1 = models.CharField(max_length=40, default="")
    status_2 = models.CharField(max_length=40, default="")
    status_3 = models.CharField(max_length=40, default="")
    status_4 = models.CharField(max_length=40, default="")
    status_5 = models.CharField(max_length=40, default="")
    status_6 = models.CharField(max_length=40, default="")
    status_7 = models.CharField(max_length=40, default="")
    status_8 = models.CharField(max_length=40, default="")
    status_9 = models.CharField(max_length=40, default="")
    status_10 = models.CharField(max_length=40, default="")
    status_11 = models.CharField(max_length=40, default="")
    status_12 = models.CharField(max_length=40, default="")
    status_13 = models.CharField(max_length=40, default="")
    status_14 = models.CharField(max_length=40, default="")
    status_15 = models.CharField(max_length=40, default="")
    status_16 = models.CharField(max_length=40, default="")
    status_17 = models.CharField(max_length=40, default="")
    status_18 = models.CharField(max_length=40, default="")
    status_19 = models.CharField(max_length=40, default="")
    status_20 = models.CharField(max_length=40, default="")
    status_21 = models.CharField(max_length=40, default="")
    status_22 = models.CharField(max_length=40, default="")
    status_23 = models.CharField(max_length=40, default="")
    status_24 = models.CharField(max_length=40, default="")
    status_25 = models.CharField(max_length=40, default="")
    status_26 = models.CharField(max_length=40, default="")
    status_27 = models.CharField(max_length=40, default="")
    status_28 = models.CharField(max_length=40, default="")
    status_29 = models.CharField(max_length=40, default="")
    status_30 = models.CharField(max_length=40, default="")
    def __str__(self):
        return self.name_text

class Pkm_item(models.Model):
    pkm_id = models.ForeignKey(Pokemon, on_delete=models.CASCADE)
    item_id = models.ForeignKey(Item, on_delete=models.CASCADE)
    count = models.BigIntegerField()

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=["pkm_id", "item_id"],
                name = "pokemon item",
            ),
        ]

    def __str__(self):
        return self.pkm_id.name_text + " : " + self.item_id.name_text

class Battle_item(models.Model):
    name_text = models.CharField(max_length=20)
    name = models.CharField(max_length=20, default="")
    img = models.CharField(max_length=200)
    level = models.IntegerField()
    effect = models.TextField()
    cooltime = models.CharField(max_length=4)

    def __str__(self):
        return self.name_text

class Pkm_battle_item(models.Model):
    pkm_id = models.ForeignKey(Pokemon, on_delete=models.CASCADE)
    battle_item_id = models.ForeignKey(Battle_item, on_delete=models.CASCADE)
    count = models.BigIntegerField()

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=["pkm_id", "battle_item_id"],
                name = "pokemon battle item",
            ),
        ]

    def __str__(self):
        return self.pkm_id.name_text + " : " + self.battle_item_id.name_text

class News(models.Model):
    title = models.CharField(max_length=50)
    img = models.CharField(max_length=200)
#    date = models.DateField()
    date = models.CharField(max_length=20)
    type = models.CharField(max_length=20)
    url = models.TextField()

    def __str__(self):
        return self.title
