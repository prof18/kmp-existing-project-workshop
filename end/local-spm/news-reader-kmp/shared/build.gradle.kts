import org.jetbrains.kotlin.gradle.plugin.mpp.apple.XCFramework

plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
    alias(libs.plugins.kotlixSerialization)
    alias(libs.plugins.skie)
    id("maven-publish")
}

version = "0.0.1"
group = "com.example.newsreaderkmp"

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }

        publishAllLibraryVariants()
    }
    
    val xcf = XCFramework("NewsReaderKMP")
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "NewsReaderKMP"
            xcf.add(this)
            isStatic = true
        }
    }

    sourceSets {
        commonMain.dependencies {
            //put your multiplatform dependencies here
            implementation(libs.kotlinx.serialization.json)
            implementation(libs.kotlin.coroutines)
        }
        commonTest.dependencies {
            implementation(libs.kotlin.test)
        }
    }
}

android {
    namespace = "com.example.newsreaderkmp"
    compileSdk = 34
    defaultConfig {
        minSdk = 24
    }
}
