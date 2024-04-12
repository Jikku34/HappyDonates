from django.db import models


# Create your models here.


class AdminDataModel(models.Model):
    admin_id = models.CharField(max_length=100, primary_key=True)
    admin_username = models.CharField(max_length=100)
    admin_password = models.CharField(max_length=100)
    admin_phone_number = models.CharField(max_length=100)
    admin_email = models.CharField(max_length=100)

    class Meta:
        db_table = "admin_data_table"


class MainCategoryModel(models.Model):
    main_category_id = models.IntegerField(primary_key=True)
    main_category_name = models.CharField(max_length=100)



    class Meta:
        db_table = "main_category_table"


class SubCategoryModel(models.Model):
    sub_category_id = models.AutoField(primary_key=True)
    sub_category_name = models.CharField(max_length=100)
    main_category_id = models.ForeignKey(
        MainCategoryModel, on_delete=models.CASCADE)

    class Meta:
        db_table = "sub_category_table"


class DonationCategoryModel(models.Model):
    donation_category_id = models.IntegerField(primary_key=True)
    donation_category_name = models.CharField(max_length=100)

    class Meta:
        db_table = "donation_category_table"


class StateModel(models.Model):
    state_id = models.IntegerField(primary_key=True)
    state_name = models.CharField(max_length=100)

    class Meta:
        db_table = "state_data_table"


class DistrictsModel(models.Model):
    district_id = models.IntegerField(primary_key=True)
    district_name = models.CharField(max_length=100)
    state_id = models.ForeignKey(StateModel, on_delete=models.CASCADE)

    class Meta:
        db_table = "districts_data_table"
