from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.db.models import Count, Q
from django.shortcuts import render, redirect
from django.utils import timezone
from datetime import date
from .models import *
from UserApp.models import *

@login_required
def home(request):
    """
    Renders the admin home page with statistics.

    :param request: HTTP request object.
    :return: Rendered admin home page with statistics.
    """
    data = {
        'user_count': User.objects.filter(is_active=True).count(),
        'post_count': UserPostModel.objects.filter(status="Active").count(),
        'donation_count': UserDonationModel.objects.filter(status="Active").count(),
        'donation_request': UserDonationModel.objects.filter(status="Pending",
                                                             category__donation_category_id=1
                                                             ).order_by('end_date')
    }
    return render(request, 'admin_home_page.html', data)


def admin_login(request):
    """
    Handles the admin login process.

    :param request: HTTP request object.
    :return: Redirects to home page if login is successful, else renders admin login page.
    """
    if request.method == 'POST':
        admin_username = request.POST.get('admin_username')
        admin_password = request.POST.get('admin_password')

        user = authenticate(username=admin_username, password=admin_password)
        if user is not None:
            login(request, user)
            return redirect('/')
    return render(request, 'admin_login.html')


@login_required
def admin_user(request):
    """
    Renders the admin user page with user statistics and search functionality.

    :param request: HTTP request object.
    :return: Rendered admin user page with user statistics and search results.
    """
    data_user = {
        'user_count': User.objects.filter(is_active=True).count(),
        'user_month_count': User.objects.filter(is_active=True,
                                                 date_joined__month=timezone.now().month,
                                                 date_joined__year=timezone.now().year).count(),
        'user_year_count': User.objects.filter(is_active=True,
                                                date_joined__year=timezone.now().year).count(),
        'user_today_count': User.objects.filter(is_active=True,
                                                 date_joined__date=date.today()).count(),
        'user_data':User.objects.annotate(post_count=Count('posts')).order_by('-date_joined')

    }

    if request.method == "POST":
        search = request.POST.get("userSearch")
        start_date = request.POST.get("startDate")
        end_date = request.POST.get("endDate")
        # results = User.objects.filter(
        #     Q(username__icontains=search) | Q(
        #         user_phone_number__icontains=search),
        #     is_active=True
        # )
        results = User.objects.filter(
            Q(username__icontains=search) ,
            is_active=True
        )
        if start_date and end_date:
            results = results.filter(
                date_joined__range=[start_date, end_date]).order_by('-date_joined')
        data_user['user_data'] = results
    return render(request, "admin_user_page.html", data_user)


@login_required
def admin_post(request):
    """
    Renders the admin post page with post statistics, search, and filtering functionality.

    :param request: HTTP request object.
    :return: Rendered admin post page with post statistics, search results, and filtering options.
    """
    data_post = {
        'post_count': UserPostModel.objects.filter(status="Active").count(),
        'post_month_count': UserPostModel.objects.filter(status="Active",
                                                         create_at__month=timezone.now().month,
                                                         create_at__year=timezone.now().year).count(),
        'post_year_count': UserPostModel.objects.filter(status="Active",
                                                        create_at__year=timezone.now().year).count(),
        'post_today_count': 0,
        'post_data': UserPostModel.objects.all().order_by('-create_at'),
        'subCategory': SubCategoryModel.objects.all().order_by('sub_category_name'),
        'Districts': DistrictsModel.objects.all().order_by('district_name'),
    }


    if request.method == "POST":
        search = request.POST.get("postSearch")
        start_date = request.POST.get("startDate")
        end_date = request.POST.get("endDate")
        postCategory = request.POST.get("postCategory")
        postLocation = request.POST.get("postLocation")

        results = UserPostModel.objects.filter(
            Q(title__icontains=search) | Q(description__icontains=search) | Q(
                address__icontains=search) |
            Q(address__icontains=search)
        )
        print(results)
        if start_date and end_date:
            results = results.filter(create_at__range=[
                start_date, end_date]).order_by('-create_at')
        if postLocation != "Loaction":
            results = results.filter(
                location=DistrictsModel.objects.get(district_id=int(postLocation))).order_by('-create_at')
        if postCategory != "Category":
            results = results.filter(
                sub_category=SubCategoryModel.objects.get(sub_category_id=int(postCategory))).order_by(
                '-create_at')
        data_post['post_data'] = results
    return render(request, "admin_post_page.html", data_post)


@login_required
def admin_category(request):
    """
    Renders the admin category page with post statistics categorized by subcategories.

    :param request: HTTP request object.
    :return: Rendered admin category page with post statistics categorized by subcategories.
    """
    data_post = {
        'post_count': UserPostModel.objects.filter(status="Active").count(),
        'post_month_count': UserPostModel.objects.filter(status="Active",
                                                         create_at__month=timezone.now().month,
                                                         create_at__year=timezone.now().year).count(),
        'post_year_count': UserPostModel.objects.filter(status="Active",
                                                        create_at__year=timezone.now().year).count(),
        'post_today_count': UserPostModel.objects.filter(status="Active",
                                                         create_at__date=date.today()).count(),
        'post_data': UserPostModel.objects.all().order_by('-create_at'),
        'subCategoryFood': SubCategoryModel.objects.annotate(count=Count('posts')).filter(main_category_id=1),
        'subCategoryNonFood': SubCategoryModel.objects.annotate(count=Count('posts')).filter(main_category_id=2)
    }

    return render(request, "admin_category_page.html", data_post)


@login_required
def admin_add_category(request):
    """
    Adds a new subcategory to the main category.

    :param request: HTTP request object.
    :return: Redirects to admin subcategory page after adding the new subcategory.
    """
    if request.method == "POST":
        sub_category_name = request.POST.get("subCategoryName")
        main_category_id = int(request.POST.get("mainCategory"))

        mainCategory = MainCategoryModel.objects.get(main_category_id=main_category_id)
        data = SubCategoryModel.objects.filter(sub_category_name=sub_category_name, main_category_id=mainCategory)
        if data:
            return render(request, 'admin_add_subcategory.html', {'status': "invalid"})
        else:
            subCategory = SubCategoryModel(main_category_id=mainCategory, sub_category_name=sub_category_name)
            subCategory.save()
            return redirect('/admin_subcategory')

    return render(request, 'admin_add_subcategory.html')


@login_required
def admin_remove_subcategory(request, id):
    """
    Removes a subcategory.

    :param request: HTTP request object.
    :param id: ID of the subcategory to be removed.
    :return: Redirects to admin subcategory page after removing the subcategory.
    """
    sub_categoryFood = SubCategoryModel.objects.filter(sub_category_id=id, main_category_id=1)
    data = SubCategoryModel.objects.get(sub_category_id=id)

    if sub_categoryFood:
        UserPostModel.objects.filter(post_sub_category=data).update(
            post_sub_category_id=4
        )
    else:
        UserPostModel.objects.filter(post_sub_category=data).update(
            post_sub_category_id=8
        )

    data.delete()
    return redirect('/admin_subcategory')


@login_required
def admin_donation_request(request):
    """
    Renders the admin donation request page with donation statistics.

    :param request: HTTP request object.
    :return: Rendered admin donation request page with donation statistics.
    """
    data_donation_request = {
        'donation_count': UserDonationModel.objects.count(),
        'active_donation_count': UserDonationModel.objects.filter(status="Active").count(),
        'donation_month_count': UserDonationModel.objects.filter(
            create_at__month=timezone.now().month,
            create_at__year=timezone.now().year
        ).count(),
        'donation_request_year_count': UserDonationModel.objects.filter(
            create_at__year=timezone.now().year
        ).count(),
    }

    return render(request, 'admin_donation_request.html', {'donation_request': data_donation_request})
