from django.db import models

class Tweet(models.Model):
    user = models.CharField(max_length=100, default='user1', null=False)
    username = models.CharField(max_length=100, help_text='@your_name', default='@user_1',null=False)
    content = models.TextField(max_length=1000, null=False)
    comments = models.IntegerField(default=0, null=False)
    retweets = models.IntegerField(default=0, null=False)
    likes = models.IntegerField(default=0, null=False)
    date_posted = models.DateField(auto_now_add=True, null=False)

    def __str__(self):
        return self.content

