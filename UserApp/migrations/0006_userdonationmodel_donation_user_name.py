# Generated by Django 5.0.4 on 2024-06-02 17:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('UserApp', '0005_alter_userdonationmodel_donation_file_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='userdonationmodel',
            name='donation_user_name',
            field=models.CharField(max_length=500, null=True),
        ),
    ]