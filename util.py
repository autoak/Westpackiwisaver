import uuid
from robot.libraries.BuiltIn import BuiltIn
from PIL import Image, ImageChops
from robot.api import logger
import os



total_actual_amt_sum=0
actual_amount_round=0
pro_rat_amt_cal=0
amt_cal=0
path = os.getenv('outputdir')
project_url = os.getenv('PROJECT_URL')
stripe_api_key = os.getenv('STRIPE_API_KEY')

def get_webdriver_instance():
    se2lib = BuiltIn().get_library_instance('SeleniumLibrary')
    return se2lib._current_browser()


def capture_element_screenshot(locator, filename):
    try:
        driver = get_webdriver_instance()
        logger.info("Get driver instance")
        logger.info(driver)
        logger.info(filename)
        driver.save_screenshot(filename)
        logger.info("Save screenshot")
        im = Image.open(filename)  # uses PIL library to open image in memory
        logger.info("Image opened")
        element = driver.find_element_by_css_selector(locator[4:])
        logger.info("Find element")
        location = element.location
        size = element.size
        left = location['x']
        top = location['y']
        right = location['x'] + size['width']
        bottom = location['y'] + size['height']
        im = im.crop((left, top, right, bottom))  # defines crop points
        logger.info("Define crop points")
        im.save(filename)  # saves new cropped image
        logger.info("Image saved")
    except:
        raise RuntimeError("Failed to capture image")


def resize_snapshot():
      for item in os.listdir(path):
        if item.startswith('selenium-screenshot') and os.stat(path + '/' + item).st_size > 100:
            try:
                im = Image.open(path + '/' + item)
                f, e = os.path.splitext(path + '/' + item)
                imResize = im.resize((640, 400), Image.ANTIALIAS)
                imResize.save(f + '.png', 'PNG', quality=100)
            except:
                print("exception happened when processing for:" + item)


def get_test_environment_name_from_project_URL(url):
    if '.dev.' in url:
        env = 'Dev'
    elif '.qa.' in url:
        env = 'QA'
    elif '.staging.' in url:
        env = 'Staging'
    elif 'https://yellow.co.nz' in url:
        env = 'Production'
    return env


def generate_uuid():
    uid = uuid.uuid4().urn
    return uid[11:]
