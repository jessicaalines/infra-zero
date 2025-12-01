#Tirando a necessidade de alocar diferentes zonas de disponibilidade manualmente (hardcoded)
data "aws_availability_zones" "available" {
    state = "available"
}