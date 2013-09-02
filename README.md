# Apache Log Analyzer

Utility to analyze Apache (Combined Log Format), and make some sense out of it. It outputs some of the most useful information per reques, and can sort requests based on their response size or response time.

Out of the box, the ``combined`` log format is supported. However, if you want to be able to sort based on response time as well, you will need define a hybrid of the ``combined`` log lormat, that simply adds the ``%D`` (time taken to serve the request, in microseconds) format string, right after the ``%b`` (response size, in bytes):

	LogFormat "%h %l %u %t \"%r\" %>s %b %D \"%{Referer}i\" \"%{User-agent}i\"" combined-and-time
	CustomLog /path/to/logfile combined-and-time

## Requirements

You need to have the following Linux utilities:
 * tail
 * awk
 * sed
 * sort
 * head

They are typically pre-installed in any Linux distribution. 

## Usage

### Make the shell script executable

	chmod a+x analyzer.sh

### Run 

	./analyzer [OPTION] LOGFILE

## Options
* -i defines input size (number of lines to analyze)

* -s defines sort method 

  * ``ascsize`` sort in ascending response size order
  * ``descsize`` reverse sort in descending response size order
  * ``asctime`` sort in ascending response time order
  * ``desctime`` reverse sort in descending response time order

## Examples

##### Out of the last 10000 requests, get the top 100 that generated the largest responses.

	./analyzer.sh -i 10000 -s dessize | head -n 100 > output.txt

##### Out of the last 100 requests, get the top 10 that generated the smallest responses

	./analyzer.sh -i 10000 -s ascsize | head -n 10 > output.txt

## Notes
 * The output of analyzer, can be piped to any other shell utility.
 
 * The response time measured by the ``%D`` Apache format string, is not the time taken by the server to generate the page. It's the time taken to server tha page.


## PS
Fuck shell scripting!
