from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^api/get-color$', views.index, name='index'),
]
