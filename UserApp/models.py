from AdminApp.models import *
from django.db import models


# Create your models here.
class UserDataModel(models.Model):
    user_id = models.CharField(max_length=100, primary_key=True)
    username = models.CharField(max_length=200)
    user_password = models.CharField(max_length=200)
    user_phone_number = models.CharField(max_length=100)
    create_at = models.DateField(auto_created=True)
    user_status =  models.CharField(max_length=100,default="Active")

    class Meta:
        db_table = "user_data_table"


class UserPostModel(models.Model):
    post_id = models.IntegerField(primary_key=True)
    user_id = models.ForeignKey(UserDataModel, on_delete=models.CASCADE)
    post_title = models.CharField(max_length=250)
    post_description = models.TextField()
    post_quantity = models.IntegerField()
    post_sub_category = models.ForeignKey(SubCategoryModel,on_delete=models.CASCADE)
    post_pick_up_time = models.DateField()
    post_end_on = models.DateTimeField(null=True)
    post_location = models.ForeignKey(DistrictsModel, on_delete=models.CASCADE)
    post_address = models.TextField()
    post_images = models.ImageField(upload_to='images/', null=True)
    user_contact_number = models.CharField(max_length=100)
    post_comments = models.CharField(max_length=300, null=True)
    post_create_at = models.DateTimeField(auto_created=True)
    post_status =  models.CharField(max_length=100,default="Active")

    class Meta:
        db_table = 'user_post_table'


class UserDonationModel(models.Model):
    donation_id = models.IntegerField(primary_key=True)
    user_id = models.ForeignKey(UserDataModel, on_delete=models.CASCADE)
    donation_title = models.CharField(max_length=400)
    donation_description = models.TextField()
    donation_category = models.ForeignKey(
        DonationCategoryModel, on_delete=models.CASCADE)
    donation_end_date = models.DateTimeField()
    donation_location = models.ForeignKey(
        DistrictsModel, on_delete=models.CASCADE)
    donation_address = models.CharField(max_length=500)
    donation_images = models.ImageField(upload_to='images/', null=True)
    user_contact_number = models.CharField(max_length=100)
    donation_comments = models.CharField(max_length=500)
    donation_create_at = models.DateTimeField(auto_created=True)
    donation_status = models.CharField(max_length=100,default="Pending")

    class Meta:
        db_table = 'user_donation_table'


class UserImageModel(models.Model):
    user_image_id = models.IntegerField(primary_key=True)
    user_image = models.ImageField()
    user_id = models.ForeignKey(UserDataModel, on_delete=models.CASCADE)

    class Meta:
        db_table = "user_image_table"
