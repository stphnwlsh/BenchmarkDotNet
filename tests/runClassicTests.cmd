@echo off

echo -----------------------------
echo Running dotnet restore
echo -----------------------------

call dotnet restore "BenchmarkDotNet.IntegrationTests\BenchmarkDotNet.IntegrationTests.csproj"

if NOT %ERRORLEVEL% == 0 (
    echo Dotnet restore has failed
    goto end
)

echo -----------------------------
echo Running .NET 4.6.2 Unit tests
echo -----------------------------

call dotnet test "BenchmarkDotNet.Tests\BenchmarkDotNet.Tests.csproj" --configuration Release --framework net462

if NOT %ERRORLEVEL% == 0 (
    echo .NET 4.6.2 Unit tests has failed
    goto end
)


echo -----------------------------
echo Running .NET 4.6.2 Integration tests
echo -----------------------------

call dotnet test "BenchmarkDotNet.IntegrationTests\BenchmarkDotNet.IntegrationTests.csproj" --configuration Release --framework net462

if NOT %ERRORLEVEL% == 0 (
    echo .NET 4.6.2 Integration tests has failed
    goto end
)

echo -----------------------------
echo All tests has passed for .NET 4.6.2
echo -----------------------------

:end