# Generated by Django 3.2.5 on 2021-08-19 09:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pokemon', '0004_test_pkm_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='test_pkm',
            name='type',
            field=models.CharField(max_length=10),
        ),
    ]
