from rest_framework.test import APITestCase
from rest_framework.reverse import reverse
from django import urls
from . import views
from rest_framework import status
from .models import Genre
from django.utils.http import urlencode


class GenreTest(APITestCase):
    def post_genre(self, genre_name):
        url = reverse(views.GenreList.view_name)
        data = {'genre_name': genre_name}
        response = self.client.post(url, data, format='json')
        return response

    def test_post_get_genre(self):
        new_genre_name = 'Super Comedy'
        response = self.post_genre(new_genre_name)
        assert response.status_code == status.HTTP_201_CREATED
        assert Genre.objects.count() == 1
        assert Genre.objects.get().genre_name == new_genre_name

    def test_unique_genre_name(self):
        new_genre_name = 'Super Comedy'
        response1 = self.post_genre(new_genre_name)
        assert response1.status_code == status.HTTP_201_CREATED
        response2 = self.post_genre(new_genre_name)
        assert response2.status_code == status.HTTP_400_BAD_REQUEST

    def test_filter_by_genre_name(self):
        new_genre_name1 = 'Super Comedy'
        new_genre_name2 = 'Drama'
        self.post_genre(new_genre_name1)
        self.post_genre(new_genre_name2)
        filter_by_genre_name = {'genre_name': new_genre_name1}
        url = '{0}?{1}'.format(reverse(views.GenreList.view_name), urlencode(filter_by_genre_name))
        response = self.client.get(url, format='json')
        assert response.status_code == status.HTTP_200_OK
        assert response.data['count'] == 1
        assert response.data['results'][0]['genre_name'] == new_genre_name1

    def test_update_genre(self):
        new_genre_name = 'Drama'
        response = self.post_genre(new_genre_name)
        url = urls.reverse(views.GenreDetail.view_name, None, {response.data['id']})
        update_genre_name = 'Drama updated'
        data = {'genre_name': update_genre_name}
        patch_response = self.client.patch(url, data, format='json')
        assert patch_response.status_code == status.HTTP_200_OK
        assert patch_response.data['genre_name'] == update_genre_name
