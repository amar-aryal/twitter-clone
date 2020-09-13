from rest_framework import serializers
from .models import Tweet

class TweetSerialzer(serializers.ModelSerializer):
    class Meta:
        fields = [
            'id',
            'user',
            'username',
            'content',
            'comments',
            'retweets',
            'likes',
            'date_posted'
        ]

        model = Tweet