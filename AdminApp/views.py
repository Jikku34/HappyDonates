from django.shortcuts import render, HttpResponse, redirect
from .models import *
from django.utils import timezone
from django.db.models import Count, Q
from UserApp.models import *
from datetime import date


# Create yourt views here.
def home(request):
    if 'admin' in request.session:
        count = AdminDataModel.objects.all().count()
        data = {
            'count': 0,
            "user_count": UserDataModel.objects.filter(user_status="Active").count(),
            "post_count": UserPostModel.objects.filter(post_status="Active").count(),
            'donation_count': UserDonationModel.objects.filter(donation_status="Active").count(),
            'donation_request': UserDonationModel.objects.filter(donation_status="Pending",
                                                                 donation_category=DonationCategoryModel.objects.get(
                                                                     donation_category_id=1)).order_by(
                'donation_end_date')
        }

        return render(request, 'admin_home_page.html', data)
    else:
        return redirect('/admin_login')


def admin_login(request):
    if request.method == 'POST':
        admin_username = request.POST.get('admin_username')
        admin_password = request.POST.get('admin_password')
        print(admin_username, admin_password)

        if AdminDataModel.objects.filter(admin_username=admin_username, admin_password=admin_password):
            request.session['admin'] = admin_username
            return redirect('/')
        else:
            return render(request, 'admin_login.html')

    return render(request, 'admin_login.html')


def admin_user(request):
    if 'admin' in request.session:
        data_user = {
            'user_count': UserDataModel.objects.filter(user_status="Active").count(),
            'user_month_count': UserDataModel.objects.filter(user_status="Active",
                                                             create_at__month=timezone.now().month,
                                                             create_at__year=timezone.now().year).count(),
            'user_year_count': UserDataModel.objects.filter(user_status="Active",
                                                            create_at__year=timezone.now().year).count(),
            # 'user_today_count': UserDataModel.objects.filter(user_status="Active",
            #                                                  create_at__date=date.today()).count(),
            'user_today_count': 0,
            'user_data': UserDataModel.objects.annotate(post_count=Count('userpostmodel')).order_by('-create_at')
        }

        if request.method == "POST":
            search = request.POST.get("userSearch")
            start_date = request.POST.get("startDate")
            end_date = request.POST.get("endDate")
            results = UserDataModel.objects.annotate(post_count=Count('userpostmodel')).filter(
                Q(username__icontains=search) | Q(
                    user_phone_number__icontains=search)
            )
            print(results)
            if start_date and end_date:
                results = results.filter(
                    create_at__range=[start_date, end_date]).order_by('-create_at')

            data_user['user_data'] = results
            return render(request, "admin_user_page.html", data_user)

        return render(request, "admin_user_page.html", data_user)
    else:
        return redirect('/admin_login')


def admin_post(request):
    if 'admin' in request.session:
        data_post = {
            'post_count': UserPostModel.objects.filter(post_status="Active").count(),
            'post_month_count': UserPostModel.objects.filter(post_status="Active",
                                                             post_create_at__month=timezone.now().month,
                                                             post_create_at__year=timezone.now().year).count(),
            'post_year_count': UserPostModel.objects.filter(post_status="Active",
                                                            post_create_at__year=timezone.now().year).count(),
            # 'user_today_count': UserDataModel.objects.filter(user_status="Active",
            #                                                  create_at__date=date.today()).count(),
            'post_today_count': 0,
            'post_data': UserPostModel.objects.all().order_by('-post_create_at'),
            'subCategory': SubCategoryModel.objects.all().order_by('sub_category_name'),
            'Districts': DistrictsModel.objects.all().order_by('district_name'),
        }
        print(data_post['post_data'])

        if request.method == "POST":
            print("LL")
            search = request.POST.get("postSearch")
            start_date = request.POST.get("startDate")
            end_date = request.POST.get("endDate")
            postCategory = request.POST.get("postCategory")
            postLocation = request.POST.get("postLocation")
            # print( search,start_date,end_date,postCategory,postLocation)
            results = UserPostModel.objects.filter(
                Q(post_title__icontains=search) | Q(post_description__icontains=search) | Q(
                    post_address__icontains=search) |
                Q(post_address__icontains=search)
            )
            print(results)
            if start_date and end_date:
                results = results.filter(post_create_at__range=[
                    start_date, end_date]).order_by('-post_create_at')
            if postLocation != "Loaction":
                results = results.filter(
                    post_location=DistrictsModel.objects.get(district_id=int(postLocation))).order_by('-post_create_at')
            if postCategory != "Category":
                results = results.filter(
                    post_sub_category=SubCategoryModel.objects.get(sub_category_id=int(postCategory))).order_by(
                    '-post_create_at')
            #
            data_post['post_data'] = results
            return render(request, "admin_post_page.html", data_post)

        return render(request, "admin_post_page.html", data_post)
    else:
        return redirect('/admin_login')


def admin_category(request):
    if 'admin' in request.session:
        data_post = {
            'post_count': UserPostModel.objects.filter(post_status="Active").count(),
            'post_month_count': UserPostModel.objects.filter(post_status="Active",
                                                             post_create_at__month=timezone.now().month,
                                                             post_create_at__year=timezone.now().year).count(),
            'post_year_count': UserPostModel.objects.filter(post_status="Active",
                                                            post_create_at__year=timezone.now().year).count(),
            # 'user_today_count': UserDataModel.objects.filter(user_status="Active",
            #                                                  create_at__date=date.today()).count(),
            'post_today_count': 0,
            'post_data': UserPostModel.objects.all().order_by('-post_create_at'),
            'subCategoryFood': SubCategoryModel.objects.annotate(post_count=Count('userpostmodel')).filter(
                main_category_id=MainCategoryModel.objects.get(main_category_id=1)),
            'subCategoryNonFood': SubCategoryModel.objects.annotate(post_count=Count('userpostmodel')).filter(
                main_category_id=MainCategoryModel.objects.get(main_category_id=2)),

        }
        print(data_post['post_data'])

        return render(request, "admin_category_page.html", data_post)
    else:
        return redirect('/admin_login')


def admin_add_category(request):
    if 'admin' in request.session:
        if request.method == "POST":
            sub_category_name = request.POST.get("subCategoryName")
            main_category_id = int(request.POST.get("mainCategory"))
            print(main_category_id, sub_category_name)
            mainCategory = MainCategoryModel.objects.get(
                main_category_id=main_category_id)
            data = SubCategoryModel.objects.filter(
                sub_category_name=sub_category_name, main_category_id=mainCategory)
            if data:
                return render(request, 'admin_add_subcategory.html', {'status': "invalid"})
            else:
                subCategory = SubCategoryModel()
                subCategory.main_category_id = mainCategory
                subCategory.sub_category_name = sub_category_name
                subCategory.save()
                return redirect('/admin_subcategory')

        return render(request, 'admin_add_subcategory.html')
    else:
        return redirect('/admin_login')


def admin_remove_subcategory(request, id):
    if 'admin' in request.session:
        sub_categoryFood = SubCategoryModel.objects.filter(sub_category_id=id,
                                                           main_category_id=MainCategoryModel.objects.get(
                                                               main_category_id=1))
        data = SubCategoryModel.objects.get(sub_category_id=id)
        print(data)

        if sub_categoryFood:
            print("this is for food")
            UserPostModel.objects.filter(post_sub_category=data).update(
                post_sub_category=SubCategoryModel.objects.get(sub_category_id=4))

            # Posts.post_sub_category = SubCategoryModel.objects.get(sub_category_id=4)
            # Posts.save()
        else:
            print("this if for  non food")
            UserPostModel.objects.filter(post_sub_category=data).update(
                post_sub_category=SubCategoryModel.objects.get(sub_category_id=8))

            # Posts.post_sub_category = SubCategoryModel.objects.get(sub_category_id=8)
            # Posts.save()
        data.delete()
        return redirect('/admin_subcategory')
    else:
        return redirect('/admin_login')


def admin_donation_request(request):
    data_donation_request = {
        'donation_count': UserDonationModel.objects.all().count(),
        'active_donation_count': UserDonationModel.objects.filter(donation_status="Active").count(),
        'donation_month_count': UserDonationModel.objects.filter(donation_create_at__month=timezone.now().month,
                                                                 donation_create_at__year=timezone.now().year).count(),
        'donation_request_year_count': UserDonationModel.objects.filter(
            donation_create_at__year=timezone.now().year).count(),

        # 'user_data': UserDataModel.objects.annotate(post_count=Count('userpostmodel')).order_by('-create_at')
    }

    return render(request, 'admin_donation_request.html',{'donation_request': data_donation_request})
