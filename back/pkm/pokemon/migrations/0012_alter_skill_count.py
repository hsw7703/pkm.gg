# Generated by Django 3.2.5 on 2021-08-24 07:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0011_alter_pokemon_passive_img'),
    ]

    operations = [
        migrations.AlterField(
            model_name='skill',
            name='count',
            field=models.BigIntegerField(default=0),
        ),
    ]
