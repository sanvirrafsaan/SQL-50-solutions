# link to problem: https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50
import pandas as pd

def not_boring_movies(cinema: pd.DataFrame) -> pd.DataFrame:
    odd_id_mask = (cinema["id"] % 2 != 0 )
    not_boring_mask = (cinema["description"] != "boring" )
    cinema_final_df = cinema[odd_id_mask & not_boring_mask]\
    .sort_values("rating", ascending= False)
    return cinema_final_df
