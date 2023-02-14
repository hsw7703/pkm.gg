# Generated by Django 3.2.7 on 2021-09-16 06:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0028_pokemon_detail_img'),
    ]

    operations = [
        migrations.AlterField(
            model_name='battle_item',
            name='img',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='evolution',
            name='img',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='item',
            name='img',
            field=models.CharField(default='', max_length=200),
        ),
        migrations.AlterField(
            model_name='news',
            name='img',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='pokemon',
            name='detail_img',
            field=models.CharField(default='', max_length=200),
        ),
        migrations.AlterField(
            model_name='pokemon',
            name='img',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='pokemon',
            name='passive_img',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='skill',
            name='img',
            field=models.CharField(max_length=200),
        ),
    ]
