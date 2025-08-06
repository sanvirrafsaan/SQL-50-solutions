
import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    low_fat_mask = (products["low_fats"] == "Y")
    recyclable_mask = (products["recyclable"] == "Y")
    filtered = products[low_fat_mask & recyclable_mask]


    return filtered[["product_id"]]
    #first, products[(column condition1) & (column condition2)] gives us the filtered table
    #then the last products[conditions][['product_id']] gives is the product id column out of filtered table
