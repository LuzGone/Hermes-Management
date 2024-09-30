module OrdersHelper
    def apenasData(tempo)
        ""+tempo.strftime('%d/%m/%Y')
    end
    def dataTempo(tempo)
        ""+tempo.strftime('%d/%m/%Y - %H:%M:%S')
    end
end
