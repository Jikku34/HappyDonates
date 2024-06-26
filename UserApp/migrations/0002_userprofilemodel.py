# Generated by Django 4.2.7 on 2024-04-13 09:33

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('UserApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfileModel',
            fields=[
                ('user_profile_id', models.AutoField(primary_key=True, serialize=False)),
                ('profile_image', models.ImageField(null=True, upload_to='')),
                ('phone', models.CharField(max_length=200, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='image', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'user_profile_table',
            },
        ),
    ]
