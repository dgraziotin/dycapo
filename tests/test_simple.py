import classes
import utils

if __name__=="__main__":
    driver = classes.Driver('driver1','password','http://127.0.0.1')
    driver.position = classes.Location(georss_point='46.490200 11.342294')
    driver.destination = classes.Location(georss_point='46.500740 11.345073',point='dest')
    driver.update_position()
    driver.get_position()
    driver.insert_trip()
    driver.delete_trip()
    