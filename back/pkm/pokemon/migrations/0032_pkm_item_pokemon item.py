# Generated by Django 3.2.5 on 2021-09-20 08:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0031_auto_20210918_1036'),
    ]

    operations = [
        migrations.AddConstraint(
            model_name='pkm_item',
            constraint=models.UniqueConstraint(fields=('pkm_id', 'item_id'), name='pokemon item'),
        ),
    ]
