# Generated by Django 3.2.5 on 2021-08-30 12:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0015_alter_item_effect_description'),
    ]

    operations = [
        migrations.RenameField(
            model_name='item',
            old_name='status_1',
            new_name='status',
        ),
        migrations.RemoveField(
            model_name='item',
            name='status_2',
        ),
        migrations.RemoveField(
            model_name='item',
            name='status_3',
        ),
    ]
