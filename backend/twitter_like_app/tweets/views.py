from django.shortcuts import render
from rest_framework import generics

from .models import Tweet
from .serializers import TweetSerialzer

class ListTweets(generics.ListCreateAPIView):
    queryset = Tweet.objects.all()
    serializer_class = TweetSerialzer

class DetailTweets(generics.RetrieveUpdateDestroyAPIView):
    queryset = Tweet.objects.all()
    serializer_class = TweetSerialzer