# Generated by Django 3.2.7 on 2021-09-22 05:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0043_rename_name_skill_name_text'),
    ]

    operations = [
        migrations.AddField(
            model_name='skill',
            name='name',
            field=models.CharField(default='', max_length=20),
        ),
    ]
