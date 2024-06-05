from django.urls import path
from . import views

urlpatterns = [

    path('', views.home, name="admin_home"),
    path('admin_login', views.admin_login, name="admin_login"),
    path('admin_user', views.admin_user, name="admin_user"),
    path('admin_post', views.admin_post, name="admin_post"),
    path('admin_subcategory', views.admin_category, name="admin_category"),
    path('admin_add_subcategory', views.admin_add_category, name="admin_add_category"),
    path('admin_remove_subcategory/<int:id>', views.admin_remove_subcategory, name="admin_remove_subcategory"),
    path('admin_donation_request', views.admin_donation_request, name='admin_donation_request'),
    path('admin_location', views.state_district_view, name='admin_location'),
    path('user/<str:user_name>/', views.user_profile, name='user_detail'),
    path('user/<str:action>/<int:user_id>/', views.update_user_status, name='update_user_status'),
    path('post/<int:post_id>/', views.post_detail_view, name='admin_post_detail'),
    path('donation/<int:donation_id>/', views.donation_detail_view, name='admin_donation_detail'),
    path('update_donation_status/<str:action>/<int:donation_id>/', views.update_donation_status, name='update_donation_status'),
    path('update_post_status/<str:action>/<int:post_id>/', views.update_post_status, name='update_post_status'),

]
