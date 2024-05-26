from django.urls import path
from . import views

urlpatterns = [
    path('api/create_post', views.saveOrUpdate_user_post, name='create_post'),
    path('api/create_post/<int:post_id>', views.saveOrUpdate_user_post, name='update_post'),
    path('api/post/', views.fetch_post, name='post'),
    path('api/post/<int:post_id>/', views.fetch_post, name='post_detail'),
    path('api/create_donation', views.saveOrUpdate_user_donation, name='create_donation'),
    path('api/create_donation/<int:donation_id>:', views.saveOrUpdate_user_donation, name='create_donation'),
    path('api/donation/', views.fetch_donation, name='donation'),
    path('api/donation/<int:donation_id>/', views.fetch_donation, name='donation_detail'),
    path('api/profile/<int:user_id>/', views.user_profile, name='user_profile'),
    path('api/districts/', views.all_districts, name='all-districts'),
    path('api/posters/', views.all_posters, name='all-posters'),
    path('api/subcategories/<int:main_category_id>/',  views.subcategories_by_main_category, name='subcategories-by-main-category'),

]
