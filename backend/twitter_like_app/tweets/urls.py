from django.urls import path

from .views import ListTweets, DetailTweets

urlpatterns = [
    path('', ListTweets.as_view()),
    path('<int:pk>/', DetailTweets.as_view()),
]