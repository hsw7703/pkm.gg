# Generated by Django 3.2.5 on 2021-09-02 04:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0022_auto_20210902_0402'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='pokemon',
            name='before_id',
        ),
        migrations.RemoveField(
            model_name='pokemon',
            name='level',
        ),
    ]
