from django.apps import AppConfig
from django.utils.translation import ugettext_lazy as _


class moviesConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'movies'
    verbose_name = _('movies')
