# Apache Log Analyzer

Utility to analyze Apache's logs (Combined Log Format), and make some sense out of it. It outputs some of the most useful information per reques, and can sort requests based on their response size.

## Requirements

You need to have the following Linux utilities:
 * tail
 * awk
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
  * ``dessize`` reverse sort in descending response size order

## Examples

##### Out of the last 10000 requests, get the top 100 that generated the largest responses.

	./analyzer.sh -i 10000 -s dessize | head -n 100 > output.txt

##### Out of the last 100 requests, get the top 10 that generated the smallest responses

	./analyzer.sh -i 10000 -s ascsize | head -n 10 > output.txt

## Notes
The output of analyzer, can be piped to any other shell utility.

## PS
Fuck shell scripting!
