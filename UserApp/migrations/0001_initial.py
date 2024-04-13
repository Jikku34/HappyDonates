# Generated by Django 4.2.7 on 2024-04-13 09:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('AdminApp', '0002_delete_admindatamodel'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='UserPostModel',
            fields=[
                ('post_id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=250, null=True)),
                ('description', models.TextField(null=True)),
                ('quantity', models.IntegerField(default=1)),
                ('pick_up_time', models.DateTimeField(null=True)),
                ('end_on', models.DateTimeField(null=True)),
                ('address', models.TextField(null=True)),
                ('images', models.ImageField(null=True, upload_to='images/')),
                ('contact_number', models.CharField(max_length=100, null=True)),
                ('comments', models.TextField(max_length=300, null=True)),
                ('create_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('status', models.CharField(default='Active', max_length=100)),
                ('location', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='posts', to='AdminApp.districtsmodel')),
                ('sub_category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='posts', to='AdminApp.subcategorymodel')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='posts', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'user_post_table',
            },
        ),
        migrations.CreateModel(
            name='UserDonationModel',
            fields=[
                ('donation_id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=400, null=True)),
                ('description', models.TextField(null=True)),
                ('end_date', models.DateTimeField(null=True)),
                ('address', models.CharField(max_length=500, null=True)),
                ('images', models.ImageField(null=True, upload_to='images/')),
                ('contact_number', models.CharField(max_length=100, null=True)),
                ('comments', models.TextField(max_length=500, null=True)),
                ('create_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('status', models.CharField(default='Pending', max_length=100)),
                ('category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='donations', to='AdminApp.donationcategorymodel')),
                ('location', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='donations', to='AdminApp.districtsmodel')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='donations', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'user_donation_table',
            },
        ),
    ]
