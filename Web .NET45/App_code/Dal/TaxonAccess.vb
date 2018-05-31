Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.Common

Public Class TaxonAccess

    Shared Sub New()
    End Sub

    Public Shared Function GetHierachical(ByVal hierachical As String, ByVal country As String, ByVal selectID As Integer) As DataTable

        Dim comm As DbCommand = GenericDataAccess.CreateCommand("ScientificName")
        comm.CommandText = "prQueryHierachical"


        Dim paramHierachical As DbParameter = comm.CreateParameter()
        paramHierachical.ParameterName = "@hierachical"
        paramHierachical.Value = hierachical
        paramHierachical.DbType = DbType.String
        comm.Parameters.Add(paramHierachical)

        Dim paramSelectID As DbParameter = comm.CreateParameter()
        paramSelectID.ParameterName = "@selectID"
        paramSelectID.Value = selectID
        paramSelectID.DbType = DbType.Int32
        comm.Parameters.Add(paramSelectID)

        Dim paramCountry As DbParameter = comm.CreateParameter()
        paramCountry.ParameterName = "@country"
        paramCountry.Value = country
        paramCountry.DbType = DbType.String
        comm.Parameters.Add(paramCountry)



        Return GenericDataAccess.ExecuteSelectCommand(comm)

    End Function

    Public Shared Function GetClass() As DataTable

        Dim comm As DbCommand = GenericDataAccess.CreateCommand("ScientificName")
        comm.CommandText = "prSelectClass"

        'Dim param As DbParameter = comm.CreateParameter()
        'param.ParameterName = "@orderBy"
        'param.Value = orderBy
        'param.DbType = DbType.String
        'comm.Parameters.Add(param)

        Return GenericDataAccess.ExecuteSelectCommand(comm)

    End Function

    Public Shared Function GetFamily(ByVal classID As Integer) As DataTable

        Dim comm As DbCommand = GenericDataAccess.CreateCommand("ScientificName")
        comm.CommandText = "prSelectFamily"

        Dim param As DbParameter = comm.CreateParameter()
        param.ParameterName = "@classID"
        param.Value = classID
        param.DbType = DbType.Int16
        comm.Parameters.Add(param)

        Return GenericDataAccess.ExecuteSelectCommand(comm)

    End Function

    Public Shared Function GetGenus(ByVal familyID As Integer) As DataTable

        Dim comm As DbCommand = GenericDataAccess.CreateCommand("ScientificName")
        comm.CommandText = "prSelectGenus"

        Dim param As DbParameter = comm.CreateParameter()
        param.ParameterName = "@familyID"
        param.Value = familyID
        param.DbType = DbType.Int16
        comm.Parameters.Add(param)

        Return GenericDataAccess.ExecuteSelectCommand(comm)

    End Function

    Public Shared Function GetSpecies(ByVal genusID As Integer) As DataTable

        Dim comm As DbCommand = GenericDataAccess.CreateCommand("ScientificName")
        comm.CommandText = "prSelectSpecies"

        Dim param As DbParameter = comm.CreateParameter()
        param.ParameterName = "@genusID"
        param.Value = genusID
        param.DbType = DbType.Int32
        comm.Parameters.Add(param)

        Return GenericDataAccess.ExecuteSelectCommand(comm)

    End Function


    Public Shared Function GetFamilyStrock(ByVal country As String) As DataSet



        Dim comm As DbCommand = GenericDataAccess.CreateCommand("ScientificName")
        comm.CommandText = "prFamilyStroke"

        If country = "TW" Then
            Dim param As DbParameter = comm.CreateParameter()
            param.ParameterName = "@charCountry"
            param.Value = country
            param.DbType = DbType.String
            comm.Parameters.Add(param)
        End If



        Return GenericDataAccess.ExecuteSelectCommandDataSet(comm)

    End Function


End Class
