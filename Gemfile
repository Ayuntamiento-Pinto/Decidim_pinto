# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/decidim/decidim.git", tag: "v0.30.9" }.freeze

###############
# Gema Decidim
###############
gem "decidim", DECIDIM_VERSION

###################
# Modulos de Decidim
###################
gem "decidim-conferences", DECIDIM_VERSION
# gem "decidim-consultations" # Anulado por incompatibilidad oficial

#####################
# Modulos de terceros
#####################
gem "decidim-age_action_authorization", git: "https://github.com/DiputacioBarcelona/decidim-diba.git", branch: "upgrade_0.30"
  # Gemas Dependencia
#
gem "decidim-decidim_awesome", "~> 0.13.0"
  # Gemas Dependencia
#
gem "decidim-file_authorization_handler", git: "https://github.com/CodiTramuntana/decidim-file_authorization_handler.git", tag: "v0.30.1.3"
  # Gemas Dependencia
#
# # # gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer", branch: "release/0.30-stable"
#

# Gemas Necesarias
# gem "webpacker" # retirado en la 0.28.x
gem "wicked_pdf"
gem "figaro"
gem "uglifier"
gem "daemons"
gem "delayed_job_active_record"
gem "whenever"
gem "openssl"

# gem "puma"


group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bootsnap"
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "faker"
end

group :development do
  gem "letter_opener_web"
  gem "listen"
 # gem "spring" # se anulan los spring porque ya vienen forzados por dependencias
 # gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end
