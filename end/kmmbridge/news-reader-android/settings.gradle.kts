pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        mavenLocal()
        google()
        mavenCentral()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/prof18/NewsReaderKMP")
            credentials {
                username = providers.environmentVariable("GITHUB_USER").get()
                password = providers.environmentVariable("GITHUB_TOKEN_CI").get()
            }
        }
    }
}

rootProject.name = "NewsReader"
include(":app")
