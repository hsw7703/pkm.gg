# Generated by Django 3.2.7 on 2021-09-27 05:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0055_alter_skill_count'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pokemon',
            old_name='difficulty',
            new_name='difficulty_text',
        ),
    ]
