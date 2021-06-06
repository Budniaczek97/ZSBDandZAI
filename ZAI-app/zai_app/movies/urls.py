from django.urls import path
from .views import GenreList, GenreDetail, MovieList, MovieDetail, ApiRoot

urlpatterns = [
    path('genres', GenreList.as_view(), name=GenreList.view_name),
    path('genres/<int:pk>', GenreDetail.as_view(), name=GenreDetail.view_name),
    path('movies', MovieList.as_view(), name=MovieList.view_name),
    path('movies/<int:pk>', MovieDetail.as_view(), name=MovieDetail.view_name),
    path('', ApiRoot.as_view(), name=ApiRoot.view_name),
]
