# Generated by Django 5.0.4 on 2024-06-03 14:51

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('AdminApp', '0004_alter_districtsmodel_district_id_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='districtsmodel',
            name='state_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='districts', to='AdminApp.statemodel'),
        ),
    ]