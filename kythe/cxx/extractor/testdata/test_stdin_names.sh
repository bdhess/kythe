#!/bin/bash -e
# Copyright 2015 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -o pipefail
BASE_DIR="${PWD}/kythe/cxx/extractor/testdata"
OUT_DIR="${PWD}/campfire-out/test/kythe/cxx/extractor/testdata/stdin_names"
EXTRACTOR="${PWD}/campfire-out/bin/kythe/cxx/extractor/cxx_extractor"
VERIFIER="${PWD}/campfire-out/bin/kythe/cxx/verifier/verifier"
INDEXER="${PWD}/campfire-out/bin/kythe/cxx/indexer/cxx/indexer"
INDEXPACK="${PWD}/campfire-out/bin/kythe/go/platform/tools/indexpack"
rm -rf -- "${OUT_DIR}"
echo '#define STDIN_OK 1\n' | KYTHE_INDEX_PACK=1 \
    KYTHE_OUTPUT_DIRECTORY="${OUT_DIR}" \
    KYTHE_VNAMES="${BASE_DIR}/stdin.vnames" "${EXTRACTOR}" -x c -
pushd "${OUT_DIR}"
OUT_INDEX=$("${INDEXPACK}" --from_archive "${OUT_DIR}" 2>&1 | \
    grep -Po 'Writing compilation unit to \K(.*)\.kindex')
popd
# Make sure that the indexer can handle <stdin:> paths.
"${INDEXER}" --ignore_unimplemented "${OUT_DIR}/${OUT_INDEX}" | \
  "${VERIFIER}" "${BASE_DIR}/test_stdin_names_verify.cc"
