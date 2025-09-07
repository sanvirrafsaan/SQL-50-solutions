#link to problem- https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50
import pandas as pd

def movie_rating(movies: pd.DataFrame, users: pd.DataFrame, movie_rating: pd.DataFrame) -> pd.DataFrame:
    mr = movie_rating.copy()
    mr['created_at'] = pd.to_datetime(mr['created_at'])

    # 1) User who rated the most movies (tie → name lexicographically smaller)
    # count ratings per user_id
    counts = mr.groupby('user_id').size().reset_index(name='cnt')
    # attach user names, then sort by count desc, name asc
    top_user = (counts.merge(users, on='user_id')
                      .sort_values(['cnt', 'name'], ascending=[False, True])
                      .head(1)['name']
                      .iloc[0])

    feb = mr[(mr['created_at'] >= '2020-02-01') & (mr['created_at'] <= '2020-02-29')]
    avg_rating = feb.groupby('movie_id')['rating'].mean().reset_index(name = 'mean_rating')
    top_movie = (avg_rating.merge(movies, on= 'movie_id')
                            .sort_values(['mean_rating', 'title'], ascending = [False, True])
                            .head(1)['title'].iloc[0]
                            )
    output = pd.DataFrame({'results': [top_user, top_movie]})

    return output
