;; Calendário de feriados (nacionais e estaduais) para Emacs.
;; 
;; Brazilian Holidays for Emacs
;; author: Flavio Regis de Arruda
;; licenses : GPLv3 - http://www.gnu.org/licenses/quick-guide-gplv3.html

(eval-when-compile
  (require 'calendar)
  (require 'holidays))

;; (calendar-set-date-style 'european)

(setq calendar-week-start-day 1
      calendar-day-name-array ["domingo" "segunda" "terça" "quarta" "quinta" "sexta" "sábado"]
      calendar-month-name-array ["Janeiro" "Fevereiro" "Março" "Abril" "Maio" "Junho" "Julho" "Agosto" "Setembro" "Outubro" "Novembro" "Dezembro"])


(setq feriados-nacionais-fixos
      `((holiday-fixed 1 1 "Ano Novo")
        (holiday-fixed 1 6 "Dia dos Reis")
        (holiday-fixed 2 18 "Término do horário de verão")
        (holiday-fixed 3 8 "Dia internacional da mulher")
        (holiday-fixed 3 20 "Equinócio de Março")
        (holiday-fixed 3 31 "Sábado de Aleluia")
        (holiday-fixed 4 19 "Dia do Índio")
        (holiday-fixed 4 21 "Dia de Tiradentes")
        (holiday-fixed 4 21 "Aniversário de Brasília")
        (holiday-fixed 4 22 "Descobrimento do Brasil")
        (holiday-fixed 5 1 "Dia do Trabalho")
        (holiday-fixed 5 13 "Dia das Mães")
        (holiday-fixed 5 13 "Abolição da Escravatura")
        (holiday-fixed 6 5 "Dia Mundial do Meio Ambiente")
        (holiday-fixed 6 11 "Dia dos Namorados")
        (holiday-fixed 6 21 "Solstício de Junho")
        (holiday-fixed 6 24 "Dia de São João")
        (holiday-fixed 6 29 "Dia de São Pedro")
        (holiday-fixed 7 9 "Revolução Constitucionalista")
        (holiday-fixed 7 29 "Dia do Amigo")
        (holiday-fixed 7 29 "Dia Internacional da Amizade")
        (holiday-fixed 9 6 "Dia de São Salvador")
        (holiday-fixed 9 12 "Dia dos pais")
        (holiday-fixed 9 7 "Dia da Independência do Brasil")
        (holiday-fixed 9 22 "Equinócio de Setembro")
        (holiday-fixed 10 7 "Eleições")
        (holiday-fixed 10 12 "Dia de Nossa Senhora Aparecida")
        (holiday-fixed 10 12 "Dia das crianças")
        (holiday-fixed 10 15 "Dia do Professor")
        (holiday-fixed 10 31 "Dia da  Reforma Protestante")
        (holiday-fixed 11 2 "Dia de Finados")
        (holiday-fixed 11 15 "Dia da Proclamação da República")
        (holiday-fixed 11 15 "Dia Nacional da Consciência Negra")
        (holiday-fixed 12 24 "Véspera de Natal")
        (holiday-fixed 12 25 "Feriado de Natal")))

(setq feriados-nacionais-moveis
      `((holiday-easter-etc 0 "Páscoa")
        (holiday-easter-etc -50 "Carnaval")
        (holiday-easter-etc -46 "Quarta-feira de cinzas")
        (holiday-easter-etc -2 "Sexta-feira Santa - Paixão de Cristo")
        (holiday-easter-etc 49 "Dia de Pentecostes")
        (holiday-easter-etc 56 "Domingo da Santíssima Trindade")
        (holiday-easter-etc 60 "Corpus Christi")))


(setq feriados-estaduais-ac
      `((holiday-fixed 6 15 "Feriado de Aniversário do Estado do Acre")
        (holiday-fixed 8 6 "Feriado de Início da Revolução Acriana")
        (holiday-fixed 9 5 "Feriado de Dia da Amazônia")
        (holiday-fixed 11 17 "Feriado de Assinatura do Tratado de Petrópolis")))

(setq feriados-estaduais-al
      `((holiday-fixed 6 24 "Feriado de São João")
        (holiday-fixed 6 29 "Feriado de São Pedro")
        (holiday-fixed 9 16 "Feriado de Emancipação Política de Alagoas")
        (holiday-fixed 11 20 "Feriado de Dia da Conciência Negra")))

(setq feriados-estaduais-ap
      `((holiday-fixed 3 19 "Feriado de São José")
        (holiday-fixed 10 5 "Feriado de Criação do Estado do Amapá")
        (holiday-fixed 11 20 "Feriado de Dia da Conciência Negra")))

(setq feriados-estaduais-am
      `((holiday-fixed 9 5 "Feriado da Elevação da Amazônia a Categoria de Província")
        (holiday-fixed 10 24 "Feriado de Aniversário de Manaus")
        (holiday-fixed 12 8  "Feriado de Nossa Senhora da Conceição")
        (holiday-fixed 11 20 "Feriado do Dia da Conciência Negra")))

(setq feriados-estaduais-ba
      `((holiday-fixed 7 2 "Feriado de Independência da Bahia")))

(setq feriados-estaduais-df
      `((holiday-fixed 4 21 "Feriado de Fundação de Brasília")
        (holiday-fixed 11 30 "Feriado do Dia do Evangélico")))

(setq feriados-estaduais-es
      `((holiday-fixed 5 23 "Feriado da Colonização do Solo Espírito-Santense")
        (holiday-fixed 10 28 "Feriado do Dia do Servidor Público")))

(setq feriados-estaduais-go
      `((holiday-fixed 7 26 "Feriado de Fundação de Goiás")
        (holiday-fixed 10 28 "Feriado do Dia do Servidor Público")))

(setq feriados-estaduais-ma
      `((holiday-fixed 7 28 "Feriado da Adesão do Maranhão à Independência do Brasil")
        (holiday-fixed 9 8  "Feriado da Fundação de São Luís")
        (holiday-fixed 12 8 "Feriado de Nossa Senhora da Conceição")))

(setq feriados-estaduais-mt
      `((holiday-fixed 11 20 "Feriado do Dia da Conciência Negra")))

(setq feriados-estaduais-ms
      `((holiday-fixed 10 11 "Feriado de Criação do Estado de MS")
        (holiday-fixed 11 20 "Feriado do Dia da Conciência Negra")))

(setq feriados-estaduais-pa
      `((holiday-fixed 8 15 "Feriado da Adesão do Grão Pará à Independência do Brasil")
        (holiday-float 10 0 2 "Feriado do Dia do Círio de Nazaré")
        (holiday-fixed 12 8 "Feriado de Nossa Senhora da Conceição")))

(setq feriados-estaduais-pb
      `((holiday-fixed 8 5 "Feriado da Fundação do Estado da Paraíba")
        (holiday-fixed 7 26 "Feriado da Memória do Ex-Presidente João Pessoa")))

(setq feriados-estaduais-pr
      `((holiday-fixed 9 8 "Feriado da Padroeira de Curitiba")
        (holiday-fixed 12 19 "Feriado da Emancipação Política")))

(setq feriados-estaduais-pe
      `((holiday-fixed 3 6 "Feriado da Revolução Pernambucana")
        (holiday-fixed 6 24 "Feriado de São João")))

(setq feriados-estaduais-pi
      `((holiday-fixed 3 13 "Feriado do Dia da Batalha de Jenipapo")
        (holiday-fixed 10 19 "Feriado do Dia do Piauí")))

(setq feriados-estaduais-rj
      `((holiday-fixed 1 20 "Feriado do Dia de São Sebastião")
        (holiday-fixed 4 23 "Feriado do Dia de São Jorge")
        (holiday-float 10 1 3 "Feriado do Dia do Comércio")
        (holiday-fixed 10 28 "Feriado do Dia do Funcionário Público")
        (holiday-fixed 11 20 "Feriado do Dia da Conciência Negra")))

(setq feriados-estaduais-rn
      `((holiday-fixed 1 6 "Feriado do Dia de Reis")
        (holiday-fixed 6 29 "Feriado do Dia de São Pedro")
        (holiday-fixed 10 3 "Feriado de Mártires de Cunhaú e Uruaçu")
        (holiday-fixed 11 21 "Feriado de Nossa Senhora da Apresentação")
        (holiday-fixed 12 25 "Feriado do Aniversário de Natal")))

(setq feriados-estaduais-rs
      `((holiday-fixed 2 2 "Feriado de Nossa Senhora de Navegantes")
        (holiday-fixed 9 20 "Feriado da Revolução Farropilha")))

(setq feriados-estaduais-ro
      `((holiday-fixed 1 4 "Feriado da Criação do Estado de Rondônia")))

(setq feriados-estaduais-rr
      `((holiday-fixed 10 5 "Feriado da Criação do Estado de Roraima")
        (holiday-fixed 12 8 "Feriado de Nossa Senhora da Conceição")))

(setq feriados-estaduais-sc
      `((holiday-fixed 8 11 "Feriado de Criação da Capitania de SC")))

(setq feriados-estaduais-sp
      `((holiday-fixed 7 9 "Feriado da Revolução Constitucionalista de 1932")
        (holiday-fixed 11 20 "Feriado do Dia da Conciência Negra")))

(setq feriados-estaduais-se
      `((holiday-fixed 7 8 "Feriado da Autonomia Política de Sergipe")))

(setq feriados-estaduais-to
      `((holiday-fixed 10 5 "Feriado de Criação do Estado de Tocantins")
        (holiday-fixed 3 18 "Feriado da Autonomia do Estado de Tocantins")
        (holiday-fixed 9 8  "Feriado de Nossa Senhora da Natividade")))



(setq calendar-holidays
      (append feriados-nacionais-fixos
              feriados-nacionais-moveis
              feriados-estaduais-sp))
