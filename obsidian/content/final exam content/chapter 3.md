cross-classified data refers to categorizing according to **two different traits**

a way to analyze categorical data is
## multinomial experiment
similar to binomial experiment
- exactly the same except there are $r$ possible outcomes on each trial, where $r\geq 2$
	- example is 6 possible outcomes on a dice

$N_{i}$ is the number of trials resulting in category $i$
$$
\sum N_{i}=n
$$
==joint probability for this is defined as:==
$$
P(N_{1}=n_{1},N_{2}=n_{2},\dots,N_{r}=n_{r})=\left( \frac{n!}{n_{1}!n_{2}!\dots n_{r}!} \right)p_{1}^{n_{1}}\dots p_{r}^{n_{r}}
$$
for any other sort of $n$, the probability is 0

for each $i=1,\dots,r$:
$$
E(N_{i})=np_{i} \text{ and } Var(N_{i})=np_{i}(1-p_{i})
$$
the $p_{i}$ are population proportions
## $\chi^{2}$ test

we want to test the null hypothesis that a set of probabilities $p_{i}$ equal their fixed and known counterparts that add up to 1

we expect $E(N_{i})=np_{i_{0}}$ since the expected number of trials should match the total's probability

we measure said discrepancy by using:
$$
\frac{(N_{i}-np_{i_{0}})^{2}}{np_{i_{0}}}=\frac{\text{(observed - expected)}^{2}}{\text{expected}}
$$
summing these up, we obtain the $\chi^{2}$ test formula
$$
\chi^{2}=\sum_{i=1}^r \frac{(N_{i}-np_{i_{0}})^{2}}{np_{i_{0}}}
$$
- $r-1$ degrees of freedom

$H_{0}$ is rejected at $\alpha$ if
$$
\chi^{2}\geq \chi^{2}_{r-1,\alpha}
$$
for $\chi^{2}$ to be valid, we need
- $r\geq 3$
- smallest $np_{i_{0}}$ must be at least $5(m/r)$ where $m$ is the number of $np_{i_{0}}$ less than 5
- rule of thumb: if $np_{i_{0}}\geq 5$ for all $i$, test is good!
- if $\chi^{2}\gg \chi^{2}_{r-1,\alpha}$, p-value is also very small

## Poisson distribution
we can test whether data follows Poisson distribution by using equation
$$
p_{i+1}=\frac{e^{-\theta}\theta^i}{i!}=\pi_{i+1}(\theta)
$$
assuming we start at 0

null hypothesis is that it actually follows the values

we can obtain an approx. $\theta$, $\hat{\theta}$ by finding the average number of variables over $n$ time

we then calculate the $\chi^{2}$ statistic using the formula
$$
\chi^{2}=\sum_{i=1}^r\frac{(N_{i}-n\pi_{i}(\hat{\theta}))^{2}}{n\pi_{i}(\hat{\theta})}
$$
similarly to the $\chi^{2}$ formula
- $r-1-l$ degrees of freedo
	- $l$ is the number of estimated parameters
		- usually only $\theta$

we reject $H_{0}$ at $\alpha$ if
$$
\chi^{2}\geq\chi^{2}_{r-1-l,\alpha}
$$
#### testing normality with $\chi^{2}$ goodness-of-fit test
1. divide range of data into $r$ class intervals
2. count number of data values that fall into class intervals as $N_{1},N_{2},\dots,N_{r}$
3. compare these counts to what we'd expect if they were *really* normally distributed

since we need mean and variance for expected counts, we estimate the parameters by $\bar{X}$ (sample mean) and $s^{2}$ (sample variance)

for example if a class interval goes from 10 to 20 with $\bar{X}=30$ and $s=15$, we'd expect:
$$
\frac{10-30}{15}=-1.33 \text{ and }\frac{20-30}{15}=-0.67
$$
where the area is $0.2514-0.0918=0.1596$

so the expected value should be at $n(0.1596)$ where we take $n$ samples

$H_{0}$ does not specify the category probabilities; it just says if the data is normally distributed
- this means the degrees of freedom is $6-2-1$ since we estimated the mean and variance

## contingency tables
fundamental contingency table problem is as follows
- one is interested in $k\geq 2$ populations
- each population can be divided into the same $r\geq 2$ categories
- one wishes to see if the proportions are the same

null hypothesis is that the proportions for each of the categories between the populations is the same
orrrr
$$
H_{0}:p_{1j}=p_{2j}=\dots=p_{kj}
$$
we can then estimate $p_{j}$ ($j$ is the common category between populations) we use a $\chi^{2}$ statistic to test $H_{0}$
- observed cell count: $n_{ij}$
- expected cell count: $\hat{e}_{ij}=n_{i}n_{.j}/n$
giving us the formula
$$
\chi^{2}=\sum_{i=1}^k\sum_{j=1}^r\frac{(n_{ij}-\hat{e}_{ij})^{2}}{\hat{e}_{ij}}
$$
- has $(k-1)(r-1)$ degrees of freedom

$H_{0}$ rejected at:
$$
\chi^{2}\geq\chi^{2}_{(k-1)(r-1),\alpha}
$$
#### testing for independence of row and column categories
null hypothesis is determined as
$$
H_{0}:p_{ij}=p_{i*}p_{j*} \text{ for all }i \text{ and } j
$$

equiv. to saying that for each $i$ and $j$, the probability that a population member falls into $i$ given member is in $j$ is the same as the unconditional probability that a member falls into row $i$

similarly, we define:
$$
\begin{align}
\hat{e}_{ij}&=\frac{(i\text{th row total})(j\text{th column total})}{n} \\
\chi^{2}&=\sum_{i=1}^I\sum_{j=1}^J\frac{(n_{ij}-\hat{e}_{ij})^{2}}{\hat{e}_{ij}} \\
&=n\sum_{i=1}^I\sum_{j=1}^J \frac{(\hat{p}_{ij}-\hat{p}_{i\cdot}\hat{p}_{\cdot j})^{2}}{\hat{p}_{i\cdot}\hat{p}_{\cdot j}}
\end{align}
$$
- where $\hat{p}_{ij}=n_{ij}/n,\hat{p}_{i\cdot}=n_{i\cdot}/n, \hat{p}_{\cdot j}=n_{\cdot j}/n$
similarly, $H_{0}$ is rejected at $\alpha$ if
$$
\chi^{2}\geq \chi^{2}_{(I-1)(J-1),\alpha}
$$
for all tests, validity is insured if all expected counts are at least 5




**Project Refactoring and Implementation**

The code has been refactored and implemented according to the requirements. The project is split into two independent scripts: `monitor.py` and `dashboard.py`. Both scripts communicate through a shared SQLite database.

**monitor.py**

```python
import logging
import sqlite3
import threading
import time

import cv2
import numpy as np
from PIL import ImageGrab
import pyautogui
from pynput import keyboard

# Configure logging to file
logging.basicConfig(filename='logger.txt', level=logging.INFO, format='%(asctime)s %(message)s')

# Establish SQLite database connection
conn = sqlite3.connect('activity.db', check_same_thread=False)
cursor = conn.cursor()

# Create the activity table if it doesn't exist
cursor.execute('''
    CREATE TABLE IF NOT EXISTS activity
    (timestamp TEXT, mouse_status TEXT, keyboard_status TEXT, screen_status TEXT)
''')

class Monitor:
    def __init__(self):
        # Initialize keyboard flag and listener
        self.typed_flag = False
        self.listener = keyboard.Listener(on_press=self.on_press)
        self.listener.start()

    def on_press(self, key):
        # Set flag to indicate a key was pressed
        self.typed_flag = True

    def capture_mouse_position(self):
        # Return current mouse position
        return pyautogui.position()

    def capture_screen_image(self):
        # Capture and return current screen as image array
        img = ImageGrab.grab()
        frame = np.array(img)
        return cv2.cvtColor(frame, cv2.COLOR_RGB2BGR)

    def compare_mouse_positions(self, start_pos, end_pos):
        # Return movement status based on mouse position change
        return "MOVED" if start_pos != end_pos else "NO MOVE"

    def compare_keyboard_activity(self):
        # Return keyboard activity status based on flag
        if self.typed_flag:
            self.typed_flag = False
            return "TYPED"
        return "NO TYPING"

    def compare_screen_images(self, img1, img2):
        # Return screen change status based on image comparison
        return "CHANGED" if not np.array_equal(img1, img2) else "NO CHANGE"

    def log_activity(self, mouse_status, keyboard_status, screen_status):
        # Save activity data to database and print/log it
        timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
        print(f"[Monitor] Logging: {timestamp}, {mouse_status}, {keyboard_status}, {screen_status}")
        cursor.execute('''
            INSERT INTO activity (timestamp, mouse_status, keyboard_status, screen_status)
            VALUES (?, ?, ?, ?)
        ''', (timestamp, mouse_status, keyboard_status, screen_status))
        conn.commit()
        logging.info(f'Logged: {timestamp}, {mouse_status}, {keyboard_status}, {screen_status}')

    def monitor_activity(self):
        # Main monitoring loop: captures, compares, and logs every 10 seconds
        while True:
            start_mouse = self.capture_mouse_position()
            start_screen = self.capture_screen_image()
            time.sleep(10)
            end_mouse = self.capture_mouse_position()
            end_screen = self.capture_screen_image()

            mouse_status = self.compare_mouse_positions(start_mouse, end_mouse)
            keyboard_status = self.compare_keyboard_activity()
            screen_status = self.compare_screen_images(start_screen, end_screen)

            self.log_activity(mouse_status, keyboard_status, screen_status)

# Run monitor in main thread
if __name__ == "__main__":
    Monitor().monitor_activity()
```

**dashboard.py**

```python
# dashboard.py (with PEP 8-compliant comments)

import sqlite3

import dash
from dash import dcc, html
from dash.dependencies import Input, Output
from dash.exceptions import PreventUpdate

import pandas as pd
import plotly.express as px


# Initialize the Dash application
app = dash.Dash(__name__)

# Define the layout of the dashboard
app.layout = html.Div([
    html.H1('Activity Dashboard'),  # Title
    dcc.Interval(id='interval', interval=5000),  # Auto-refresh interval (every 5 seconds)
    html.Div(id='last-activity'),  # Display last activity timestamp
    dcc.Graph(id='activity-graph')  # Pie chart of active vs idle
])

# Callback to update the last activity timestamp
@app.callback(
    Output('last-activity', 'children'),
    Input('interval', 'n_intervals')
)
def update_last_activity(n):
    try:
        # Open a new SQLite connection per callback for thread safety
        conn = sqlite3.connect('activity.db', check_same_thread=False)
        cursor = conn.cursor()
        cursor.execute('SELECT timestamp FROM activity ORDER BY datetime(timestamp) DESC LIMIT 1')
        result = cursor.fetchone()
        conn.close()

        # Return the most recent activity timestamp
        if result:
            return f'Last activity: {result[0]}'
        else:
            return 'No activity logged'
    except Exception:
        return 'Error reading from database'

# Callback to update the activity pie chart
@app.callback(
    Output('activity-graph', 'figure'),
    Input('interval', 'n_intervals')
)
def update_activity_graph(n):
    try:
        # Open SQLite connection safely
        conn = sqlite3.connect('activity.db', check_same_thread=False)
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM activity ORDER BY datetime(timestamp) DESC")
        rows = cursor.fetchall()
        conn.close()

        if not rows:
            raise PreventUpdate  # Skip update if no data

        # Convert to DataFrame
        df = pd.DataFrame(rows, columns=['timestamp', 'mouse_status', 'keyboard_status', 'screen_status'])

        # Determine whether each row is active or idle
        df['active'] = df.apply(
            lambda row: any(status.strip() in ['MOVED', 'TYPED', 'CHANGED'] for status in [
                str(row['mouse_status']), str(row['keyboard_status']), str(row['screen_status'])
            ]),
            axis=1
        )

        # Calculate counts
        active_count = df['active'].sum()
        idle_count = len(df) - active_count

        if active_count + idle_count == 0:
            raise PreventUpdate

        # Create pie chart
        fig = px.pie(
            values=[active_count, idle_count],
            names=['Active', 'Idle'],
            title='Active vs Idle (all time)'
        )
        return fig
    except Exception:
        raise PreventUpdate

# Start the Dash server
if __name__ == "__main__":
    app.run(debug=True)
```

**Additional Notes**
- Creating additional threads is not necessary for this script, since the template of the monitor script implies it will be used on each user's device.
- `pynput` will be used for keyboard monitoring and will automatically check for key inputs every 10 seconds as specified.
- `sqlite3` by default handles concurrent database read and writes by locking the database per process.

**Usage**
1. Run `monitor.py` to start monitoring activity.
2. Run `dashboard.py` to start the Dash app.
3. Open a web browser and navigate to `http://127.0.0.1:8050/` to view the activity dashboard.

The dashboard will display the last activity timestamp and a pie chart showing the ratio of active vs idle time. The chart will update every five seconds.