package com.example.newsreader.presentation

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.newsreaderkmp.domain.News
import com.example.newsreader.presentation.ui.theme.NewsReaderTheme

class MainActivity : ComponentActivity() {

    private val viewModel: MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            NewsReaderTheme {
                val uiState by viewModel.uiState.collectAsState()

                NewsScreen(uiState = uiState)
            }
        }
    }
}

@Composable
private fun NewsScreen(uiState: UiState) {
    when (uiState) {
        is UiState.Loading -> LoadingView()
        is UiState.Success -> NewsList(uiState)
        is UiState.Error -> ErrorView(uiState.message)
    }
}

@Composable
private fun NewsList(uiState: UiState.Success) {
    LazyColumn {
        items(uiState.newsList) { news ->
            NewsCard(
                news = news
            )
        }
    }
}

@Composable
private fun ErrorView(reason: String) {
    Text(reason)
}

@Composable
private fun LoadingView() {
    Box(
        modifier = Modifier.fillMaxSize()
    ) {
        CircularProgressIndicator(
            modifier = Modifier.align(Alignment.Center)
        )
    }
}

@Composable
internal fun NewsCard(news: News) {
    val context = LocalContext.current

    Card(
        shape = RoundedCornerShape(16.dp),
        modifier = Modifier
            .clickable(onClick = {
                context.startActivity(
                    Intent(
                        Intent.ACTION_VIEW,
                        Uri.parse(news.url)
                    )
                )
            })
            .padding(8.dp)
            .fillMaxWidth()
    ) {

        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = news.title,
                style = TextStyle(fontSize = 18.sp)
            )
            Spacer(Modifier.height(9.dp))
            Text(
                text = news.formattedDate,
            )
        }
    }
}

@Preview(showBackground = true)
@Composable
private fun NewsListSuccess() {
    NewsReaderTheme {
        NewsScreen(
            uiState = UiState.Success(
                newsList = listOf(
                    News(
                        title = "Android 12",
                        url = "https://android.com",
                        formattedDate = "2021-09-01",
                    ),
                    News(
                        title = "Android 11",
                        url = "https://android.com",
                        formattedDate = "2021-09-01",
                    ),
                ),
            ),
        )
    }
}

@Preview(showBackground = true)
@Composable
private fun NewsListLoading() {
    NewsReaderTheme {
        NewsScreen(
            uiState = UiState.Loading,
        )
    }
}

@Preview(showBackground = true)
@Composable
private fun NewsListError() {
    NewsReaderTheme {
        NewsScreen(
            uiState = UiState.Error(
                message = "Network Error",
            ),
        )
    }
}
