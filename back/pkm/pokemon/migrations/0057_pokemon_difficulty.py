# Generated by Django 3.2.7 on 2021-09-27 05:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0056_rename_difficulty_pokemon_difficulty_text'),
    ]

    operations = [
        migrations.AddField(
            model_name='pokemon',
            name='difficulty',
            field=models.CharField(default='', max_length=10),
        ),
    ]
