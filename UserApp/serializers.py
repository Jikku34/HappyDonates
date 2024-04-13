from rest_framework import serializers
from .models import UserPostModel, UserDonationModel,UserProfileModel


class UserPostSerializer(serializers.ModelSerializer):
    sub_category_name = serializers.SerializerMethodField()
    district_name = serializers.SerializerMethodField()
    user_name = serializers.SerializerMethodField()

    class Meta:
        model = UserPostModel
        fields = '__all__'

    def get_sub_category_name(self, obj):
        return obj.sub_category.sub_category_name if obj.sub_category else None

    def get_district_name(self, obj):
        return obj.location.district_name if obj.location else None

    def get_user_name(self, obj):
        return obj.user.username if obj.user else None


class UserDonationSerializer(serializers.ModelSerializer):
    donation_category_name = serializers.SerializerMethodField()
    district_name = serializers.SerializerMethodField()
    user_name = serializers.SerializerMethodField()

    class Meta:
        model = UserDonationModel
        fields = '__all__'

    def get_donation_category_name(self, obj):
        return obj.category.donation_category_name if obj.category else None

    def get_district_name(self, obj):
        return obj.location.district_name if obj.location else None

    def get_user_name(self, obj):
        return obj.user.username if obj.user else None

class UserProfileSerializer(serializers.ModelSerializer):
    """
    Serializer for UserProfileModel.
    """
    class Meta:
        model = UserProfileModel
        fields = ['user_profile_id', 'profile_image', 'phone', 'user']